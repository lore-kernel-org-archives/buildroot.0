From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Feb 2019 20:46:27 +0000
Subject: [Buildroot] [Bug 11671] russian locale ru_RU:145: LC_TIME: syntax
 error
In-Reply-To: <bug-11671-163@https.bugs.busybox.net/>
References: <bug-11671-163@https.bugs.busybox.net/>
Message-ID: <bug-11671-163-hpWScHB7w8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11671

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Apply the following two patches:

- host-localedef: Compile against glibc [1]
- localedef: update to glibc-2.28 and various fixes [2]

Fixed the problem for me, tested with raspberrypi3_defconfig, with the
following changes:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_GENERATE_LOCALE="ru_RU"
BR2_SYSTEM_ENABLE_NLS=y

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/950717
[2] https://patchwork.ozlabs.org/patch/1008984

-- 
You are receiving this mail because:
You are on the CC list for the bug.
