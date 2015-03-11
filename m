From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2015 16:10:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7921] New: uClibc fails building with minimal
 config and TLS disabled
Message-ID: <bug-7921-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7921

           Summary: uClibc fails building with minimal config and TLS
                    disabled
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nrubinstein at aldebaran.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The current version of Buildroot
f57423064ef0c22717db370d126bff832e7e1fd5
fails building with this minimal defconfig:

BR2_KERNEL_MIRROR="http://www.kernel.org/pub"
BR2_LUAROCKS_MIRROR="http://luarocks.org/repositories/rocks"
BR2_CPAN_MIRROR="http://search.cpan.org/CPAN"
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_BINUTILS_VERSION_2_22=y
BR2_GCC_VERSION_4_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
# BR2_GCC_ENABLE_TLS is not set
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_INIT_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BOOST=y
# BR2_TARGET_ROOTFS_TAR is not set

When BR2_GCC_ENABLE_TLS is set, the configuration builds correctly.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
