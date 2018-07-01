From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 Jul 2018 18:05:47 +0000
Subject: [Buildroot] [Bug 11096] Upgrade from glibc 2.26 to 2.27 broke some
 locales (ru_RU in particular)
In-Reply-To: <bug-11096-163@https.bugs.busybox.net/>
References: <bug-11096-163@https.bugs.busybox.net/>
Message-ID: <bug-11096-163-ZFQ9qPjK51@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11096

--- Comment #2 from romain.naour at gmail.com ---
Hi,

So, we really have a problem with host-localedef...

Our current version is outdated (based on eglibc) and doesn't work with glibc
2.26. Localedef package version should be the same as glibc package because
localedef program is part of glibc and building it require glibc sources.

Yocto and ptxdist maintain some "hack/workaround" to only build localedef for
the host [1] [2].

Also, pre compiled toolchain doesn't provide localdef binary for the host along
with glibc provided for the target.

I'm not sure if we should allow using BR2_GENERATE_LOCALE for external
toolchains since there is no guaranties that localedef is compatible with
toolchain locale.

Best regards,
Romain

[1]
https://git.pengutronix.de/cgit/ptxdist/tree/patches/localedef-glibc-2.27/0001-HACK-only-build-and-install-localedef.patch

[2] git://github.com/kraj/localedef and
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-core/glibc/cross-localedef-native_2.26.bb?id=rocko-18.0.3

-- 
You are receiving this mail because:
You are on the CC list for the bug.
