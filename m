From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Date: Mon, 13 Jul 2020 11:36:03 +0200
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.1.2 is released
Message-ID: <d0dd301f-d03d-a406-eea1-e39be99369d0@sigma-star.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

mtd-utils-2.1.2 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.2.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.2.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.2


Alternatively also mirrored here:

Tarball:               https://infraroot.at/pub/mtd/mtd-utils-2.1.2.tar.bz2
Tarball gpg signature: https://infraroot.at/pub/mtd/mtd-utils-2.1.2.tar.bz2.asc
Signed git tag:        https://git.infraroot.at/mtd-utils.git v2.1.2


After a while of inactivity, I decided to release the current backlog of
fixes as mtd-utils version 2.1.2.

As already said, the changes since 2.1.1 are primarily bug fixes, addressing
compiler warnings and issues reported by diagnostic tools, but also build
failures for some configurations.

Besides the bug fixes, this version also finally pulls in the ubihealthd and
mkfs.ubifs authentication patches.


Changes from 2.1.1 to 2.1.2:

Features:
      flashcp: Add option -A/--erase-all
      mtd-utils: add optional offset parameter to flash_otp_dump
      ubi-utils: Implement a ubihealthd
      mkfs.ubifs: Add authentication support

Fixes:
      ubifs-media: Update to Linux-5.3-rc3
      mtd-utils: Fix return value of ubiformat
      ubiupdatevol: Prevent null pointer dereference
      libubigen: remove unnecessary include
      libubi: remove private kernel header from includes
      mkfs.ubifs: fscrypt: bail from encrypt_block if gen_essiv_salt fails
      mkfs.ubifs: abort add_directory if readdir fails
      mkfs.ubifs: close file descriptor in add_file error path
      mkfs.ubifs: don't leak copied command line arguments
      mkfs.ubifs: free derived fscrypt context in add_directory error paths
      mkfs.ubifs: don't leak hastable iterators
      mkfs.ubifs: don't leak temporary buffers
      mkfs.ubifs: propperly cleanup in ALL interpret_table_entry error paths
      mkfs.jffs2: don't leak temporary buffer if readlink fails
      libmtd: don't leak temporary buffers
      ftl_check: don't leak temporary buffers
      ftl_format: don't leak temporary buffers
      ubiformat: don't leak file descriptors
      nanddump: don't leak copied command line arguments
      mtd_debug: cleanup error handling in flash_to_file
      jittertest: fix error check for open system call
      fs-tests: don't leak temporary buffers
      mtd-utils: Fix printf format specifiers with the wrong type
      mtd-utils: Fix potential negative arguments passed to close(2)
      mtd-utils: Fix various TOCTOU issues
      mtd-utils: Fix some simple cases of uninitialized value reads
      mtd-utils: Fix wrong argument to sizeof in nanddump
      mtd-utils: Fix "are we really at EOF" test logic in libubi read_data
      mtd-utils: Fix potentially unterminated strings
      mtd-utils: Add checks to code that copies strings into fixed sized buffers
      mkfs.ubifs: fix broken build if fscrtyp is disabled



Raw short log since the 2.1.1 release:

Alexander Dahl (2):
      ubihealthd: Add missing sentinel in options array
      ubihealthd: Add option -h/--help

Andrij Abyzov (1):
      flashcp: Add option -A/--erase-all

Barry Grussling (1):
      mtd-utils: Fix return value of ubiformat

Bastian Germann (3):
      ubiupdatevol: Prevent null pointer dereference
      libubigen: remove unnecessary include
      libubi: remove private kernel header from includes

David Oberhollenzer (28):
      Add the mkfs.ubifs sign.h header to the list of sources
      Add ubihealthd to gitignore file
      mkfs.ubifs: fscrypt: bail from encrypt_block if gen_essiv_salt fails
      mkfs.ubifs: abort add_directory if readdir fails
      mkfs.ubifs: close file descriptor in add_file error path
      mkfs.ubifs: don't leak copied command line arguments
      mkfs.ubifs: free derived fscrypt context in add_directory error paths
      mkfs.ubifs: don't leak hastable iterators
      mkfs.ubifs: don't leak temporary buffers
      mkfs.ubifs: propperly cleanup in ALL interpret_table_entry error paths
      mkfs.jffs2: don't leak temporary buffer if readlink fails
      libmtd: don't leak temporary buffers
      ftl_check: don't leak temporary buffers
      ftl_format: don't leak temporary buffers
      ubiformat: don't leak file descriptors
      nanddump: don't leak copied command line arguments
      mtd_debug: cleanup error handling in flash_to_file
      jittertest: fix error check for open system call
      fs-tests: don't leak temporary buffers
      mtd-utils: Fix printf format specifiers with the wrong type
      mtd-utils: Fix potential negative arguments passed to close(2)
      mtd-utils: Fix various TOCTOU issues
      mtd-utils: Fix some simple cases of uninitialized value reads
      mtd-utils: Fix wrong argument to sizeof in nanddump
      mtd-utils: Fix "are we really at EOF" test logic in libubi read_data
      mtd-utils: Fix potentially unterminated strings
      mtd-utils: Add checks to code that copies strings into fixed sized buffers
      mkfs.ubifs: fix broken build if fscrtyp is disabled

Marek Vasut (1):
      ubihealthd: Build only if sys/random.h is present

Michael Walle (1):
      mtd-utils: add optional offset parameter to flash_otp_dump

Richard Weinberger (1):
      ubi-utils: Implement a ubihealthd

Sascha Hauer (2):
      ubifs-media: Update to Linux-5.3-rc3
      mkfs.ubifs: Add authentication support


Regards,

David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200713/ae8ab444/attachment.asc>
