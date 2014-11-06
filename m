From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 00:20:16 +0100
Subject: [Buildroot] [PATCH v2 00/30] Removal of BR2_GCC_TARGET_TUNE and
	other arch/ updates
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 21 Oct 2014 22:26:47 +0200")
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87oasjykzz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > As discussed during the Buildroot Developers meeting, this patch
 > series implement a few changes to the handling of the
 > BR2_GCC_TARGET_{ARCH,CPU,TUNE} options.

 > In sequence, this patch series:

 >  - PATCH 1 introduces a number of ARM architecture blind options:
 >    BR2_ARM_CPU_ARMV4, BR2_ARM_CPU_ARMV5, BR2_ARM_CPU_ARMV6,
 >    BR2_ARM_CPU_ARMV7A. These options will allow to simplify testing
 >    against an ARM architecture (instead of using each individual ARM
 >    core), and also allow to remove tests against BR2_GCC_TARGET_ARCH
 >    on ARM, since we later get rid of all values for this variable on
 >    ARM as part of a later patch in this series.

 >  - PATCH 2 to 19 make use of those new blind options to replace a
 >    number of dependencies/conditions on individual ARM cores by
 >    dependencies/conditions on ARM architecture levels.

 >  - PATCH 20 fixes the dhcpcd package as it uses the
 >    BR2_GCC_TARGET_ARCH value, which may not always exists on certain
 >    architectures.

 >  - PATCH 21 and 22 remove the BR2_GCC_TARGET_ARCH values from the ARM
 >    architecture, since they are causing conflicts with the
 >    BR2_GCC_TARGET_CPU values. We now only specify the -mcpu value
 >    (through BR2_GCC_TARGET_CPU), and let gcc derive the corresponding
 >    ARM architecture. This fixes a long standing bug report where
 >    Buildroot would pass conflicting -march and -mcpu values for
 >    certain versions of gcc.

 >  - PATCH 23 prepares ffmpeg for the removal of BR2_GCC_TARGET_TUNE by
 >    using BR2_GCC_TARGET_ARCH or BR2_GCC_TARGET_CPU instead.

 >  - PATCH 24 to 27 modifies the architecture definitions to no longer
 >    use BR2_GCC_TARGET_TUNE, and instead use BR2_GCC_TARGET_CPU or
 >    BR2_GCC_TARGET_ARCH as appropriate.

 >  - PATCH 28 to 30 finally get rid of BR2_GCC_TARGET_TUNE entirely
 >    since it is no longer used.

Committed remainder of series, thanks!

-- 
Bye, Peter Korsgaard
