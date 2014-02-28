From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Feb 2014 13:01:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140228130111.AE5059BC4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #8 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-28 13:01:10 UTC ---
Config file for toolchain:
BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV3=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_24=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US de "


I can indeed confirm that uClibc builds crt1.o from crt1.S, using the command
line as specified in comment #7.

Looking in the binutils sources (that creates the assembler), I do find
references to ABI_VFP, but I don't see places where it is actually emitted in
the build, unless the source assembly file contains a statement
.eabi_attribute.

So the statements made by the submitter seem to be valid.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
