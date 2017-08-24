From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Date: Thu, 24 Aug 2017 15:11:54 +0200
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.0.1 is released
Message-ID: <3e33819a-64ee-88ca-308a-eb992a45d322@sigma-star.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

mtd-utils-2.0.1 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.1.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.1.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.0.1


This release contains mainly bug fixes and cleanups that have accumulated
since the release of mtd-utils 2.0.0.


Changes from 2.0.0 to 2.0.1:

Features:
 - nandbiterrs: Add Erased Pages Bit Flip Test
 - mkfs.ubifs: Add support for symlinks in device table
 - nanddump: Add --skip-bad-blocks-to-start option
 - nandwrite: Add --skip-bad-blocks-to-start option

Fixes:
 - common: Always terminate with failure status if command line options
   are unknown or missing
 - common: Fix format specifier definitions for off_t and loff_t.
 - common: More consistent exit codes
 - libmtd: Fix error status if MTD is not present on the system
 - libubi: Add klibc specific fixes for ioctl
 - libubi: Fix error status in ubi_get_vol_info1 for non-existing volumes
 - misc-utils: Support jffs2 flash-erase for large OOB (>32b)
 - mkfs.jffs2: Add missing header inclusions required for build with musl
 - mkfs.ubifs: Fix alignment trap triggered by NEON instructions
 - mkfs.ubifs: Fix uuid.h path
 - mkfs.ubifs: Replace broken ubifs_assert with libc assert
 - nandbiterrs: Actually get the new ECC bit flip count before comparing stats
 - nandpagetest: Improved argument sanity checking
 - nandwrite: Fix bad block skipping
 - nandwrite: Improved argument sanity checking
 - ubinfo: Improved argument sanity checking
 - ubi-tests: Replace variable-length array with malloc()
 - ubi-tests: Support up to 64k NAND page size

Cleanup:
 - build-system: Enable compiler warnings
 - build-system: Restructure autoconf dependency checking
 - common: Add const modifier to read only strings and string constants
 - common: Eliminate warnings about missing prototypes
 - common: Get rid of rpmatch usage
 - common: Remove README.udev from ubi-tests extra dist
 - common: Remove unused variables and functions
 - common: Silence warnings about unused arguments
 - flashcp: Drop custom defines for EXIT_FAILURE and EXIT_SUCCESS
 - libiniparser: remove unused function needing float
 - libmissing: Use autoconf header detection directly
 - libubi: Remove UDEV_SETTLE_HACK
 - misc-utils: Move libfec to common public header & library directory
 - nandwrite: replace erase loop with mtd_erase_multi
 - serve_image: Use PRIdoff_t as format specifier.
 - ubi-tests: Speedup io_paral by using rand_r()
 - ubirename: Fix spelling


Raw short log since the 2.0.0 release:


Aaron Marcher (1):
      mtd-utils: ubinfo: add parameter check

Andrea Adami (2):
      libubi.c: add klibc specific fixes for ioctl
      libiniparser: remove unused function needing float

Daniel Wagner (6):
      Use defines for exit code values
      flashcp: Drop exit code defines
      ftl_format: Use return directly to leave main function
      jffsX-utils: Return error code if command line option is unknown
      nor-utils: Return error code if command line option is unknown
      ubi-utils: Return error code if command line option is unknown

David Engraf (1):
      mkfs.ubifs: Add support for symlinks in device table

David Gstir (1):
      ubi: tests: Replace variable-length array with malloc()

David Oberhollenzer (17):
      nandwrite: add stricter sanity checking for blockalign
      nandwrite: replace erase loop with mtd_erase_multi
      nandwrite: fix/cleanup bad block skipping
      Remove README.udev from ubi-tests extra dist
      Replace rpmatch() usage with checking first character of line
      Fix libmtd behaviour if MTD is not present on the system
      Return correct error number in ubi_get_vol_info1
      Replace defunct ubifs_assert
      Restructure autoconf configure.ac
      Use autoconf header detection correctly for libmissing
      Move libfec declarations to public header in global include directory
      Enable compiler warnings
      Eliminate warnings about missing prototypes
      Remove unused variables and functions
      Silence warnings about unused arguments
      Add const modifier to read only strings and string constants
      Release mtd-utils-2.0.1

Harpreet Eli Sangha (2):
      mtd-utils: tests: Fix nandbiterrs Failure Check
      mtd-utils: tests: Add Erased Pages Bit Flip Test

Khem Raj (1):
      Fix build with musl

Luca Ceresoli (1):
      ubirename: trivial fixes to the help text

Manikandan Ramachandran (1):
      mtd-utils: Support jffs2 flash-erase for large OOB (>32b)

Mike Crowe (2):
      nandwrite: Add --skip-bad-blocks-to-start option
      nanddump: Add --skip-bad-blocks-to-start option

Miquel Raynal (1):
      mtd-utils: tests: Avoid using less than two blocks in nandpagetest

Richard Weinberger (3):
      Remove UDEV_SETTLE_HACK
      ubi: tests: Support up to 65k NAND page size
      ubi: tests: Speedup io_paral by using rand_r()

Rolf Eike Beer (1):
      mkfs-ubifs: fix inclusion of uuid.h

Torsten Fleischer (2):
      mtd-utils: Fix format specifier definitions for off_t and loff_t.
      mtd-utils: serve_image: Use PRIdoff_t as format specifier.

Yuanjie Huang (1):
      Fix alignment trap triggered by NEON instructions


Regards,

David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170824/b45aca38/attachment.asc>
