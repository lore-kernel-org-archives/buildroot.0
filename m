From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 Jun 2018 21:45:42 +0000
Subject: [Buildroot] [Bug 11096] Upgrade from glibc 2.26 to 2.27 broke some
 locales (ru_RU in particular)
In-Reply-To: <bug-11096-163@https.bugs.busybox.net/>
References: <bug-11096-163@https.bugs.busybox.net/>
Message-ID: <bug-11096-163-35rSviXUOa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11096

--- Comment #1 from romain.naour at gmail.com ---
Hi,

Are you sure that Buildroot is using localedef from the host?
Buildroot is building it's own localedef version from [1] which is probably too
old for glibc 2.27.
Maybe we have to bump localedef to [2] which is used by Yocto?

localedef is build by the glibc package but for the target, so we really need
to build it outside of glibc package.

Best regards,
Romain

[1]
http://www.pengutronix.de/software/ptxdist/temporary-src/localedef-eglibc-2.14.1-r17443-ptx1.tar.bz2

[2] git://github.com/kraj/localedef

-- 
You are receiving this mail because:
You are on the CC list for the bug.
