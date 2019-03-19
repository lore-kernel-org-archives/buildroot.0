From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Date: Tue, 19 Mar 2019 18:23:58 +0100
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.1.0 is released
Message-ID: <678ab76b-7707-93fb-1be4-8bb4cafdfcef@sigma-star.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

mtd-utils-2.1.0 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.0.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.0.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.0


After quite some time that has passed since the last mtd-utils release, the
new 2.1.0 release brings (as usual) a lot of fixes but also some new features.

More precisely, it includes the long anticipated mkfs.ubifs support for file
level encryption, better mkfs.ubifs tooling for SELinux and an lsblk like
utility for inspecting the MTD/UBI stack on a system. Hence the minor version
bump.

While the mkfs.ubifs encryption support has seen some use already and should
work (TM) for most use cases, I expect that fixes for various untested edge
cases will eventually be merged over the coming months up to the next patch
level release.


Changes from 2.0.2 to 2.1.0:

Features:
 - mkfs.ubifs: Implement support for file system encryption
 - mkfs.ubifs: Implement selinux labelling support
 - ubinize: add support for skipping CRC check of a static volume when opening
 - ubimkvol: add support for skipping CRC check of a static volume when opening
 - Add lsmtd program

Fixes:
 - update various kernel headers
 - Instead of doing preprocessor magic, just output off_t as long long
 - fix verification percent display in flashcp
 - mkfs.ubifs: fix double free
 - mkfs.ubifs: Fix xattr nlink value
 - ubinize: avoid to create two UBI_LAYOUT_VOLUME_ID volume
 - common.h: fix prompt function
 - libmtd: don't print an error message for devices without ecc support
 - io_paral: Fix error handling of update_volume()
 - ubimkvol: Initialize req to zero to make sure no flags are set by default
 - libubi: add volume flags to ubi_mkvol_request
 - mkfs.ubifs: add_xattr is not depending on host XATTR support
 - Revert "Return correct error number in ubi_get_vol_info1" which
   introduced a regression.
 - make sure pkg-config is installed in configure script
 - ubiformat: process command line arguments before handling file arguments

Cleanup:
 - ubiformat: remove no-volume-table option


Raw short log since the 2.0.2 release:


Andrij Abyzov (1):
      mtd-utils: fixes verification percent display in flashcp

Boris Brezillon (1):
      ubi-utils: ubimkvol: Initialize req to zero to make sure no flags are set by default

David Gstir (1):
      mkfs.ubifs: fix default cipher in help output

David Oberhollenzer (24):
      ubiformat: process command line arguments first
      ubiformat: remove no-volume-table option
      mtd-utils: make sure pkg-config is installed in configure script
      Revert "Return correct error number in ubi_get_vol_info1"
      Add lsmtd program
      Add manpage for lsmtd
      Add configure switch to disable compiling/installing lsmtd
      libmtd: don't print an error message for devices without ecc support
      mtd-utils: common.h: fix prompt function
      mkfs.ubifs: Add crypto helper functions
      mkfs.ubifs: Implement UBIFS_FLG_DOUBLE_HASH
      mkfs.ubifs: Move symlink data encryption to helper function
      mkfs.ubifs: Seperate path encryption from symlink encryption helper
      mkfs.ubifs: Cleanup add_dent_node, user path encryption helper
      mkfs.ubifs: Replace constant values with parameters in init_fscrypt_context
      mkfs.ubifs: Make encryption dependend on (not-yet-existant) command line options
      mkfs.ubifs: Get key descriptor from command line and master key from file
      mkfs.ubifs: Specify padding policy via command line
      mkfs.ubifs: Initial support for encryption command lines
      mkfs.ubifs: Remove cipher implementations from public header
      mkfs.ubifs: Move fscrypt definitions and functions out of mkfs.ubifs.c
      mkfs.ubifs: Cleanup over-long lines
      mkfs.ubifs: Check length of master key
      mkfs.ubifs: Accept 0x prefix for key descriptor

Martin Lund (1):
      ubi-tests: io_paral: Fix error handling of update_volume()

Quentin Schulz (4):
      UBI: update ubi-user.h and ubi-media.h
      libubi: add volume flags to ubi_mkvol_request
      ubi-utils: ubimkvol: add support for skipping CRC check of a static volume when opening
      ubi-utils: ubinize: add support for skipping CRC check of a static volume when opening

Richard Weinberger (30):
      Import latest ubifs-media.h
      common: Add round functions
      mkfs.ubifs: Make r5 hash binary string aware
      mkfs.ubifs: Add fscrypto defines
      mkfs.ubifs: Add basic fscrypto functions
      mkfs.ubifs: Implement UBIFS_FLG_ENCRYPTION
      mkfs.ubifs: Implement basic fscrypto context passing
      mkfs.ubifs: Implement fscrypto context store as xattr
      mkfs.ubifs: Store directory name len in the temporary index
      mkfs.ubifs: Implement filename encryption
      mkfs.ubifs: Add dummy setup for crypto
      mkfs.ubifs: Pass source/dest key len to key derive function
      mkfs.ubifs: Add encrypted symlink support
      mkfs.ubifs: Implement file contents encryption
      mkfs.ubifs: Make sure we catch nodes that should or should not have name
      mkfs.ubifs: Free all index entry names
      mkfs.ubifs: Correctly use iv lengths in aes-cts mode
      mkfs.ubifs: Enable Cipher selection
      mkfs.ubifs: Use correct sizes for keys and hash lengths
      mkfs.ubifs: Fixup AES-XTS mode
      mkfs.ubifs: Compute encryption key descriptor automatically
      mkfs.ubifs: Fix key descriptor printing
      mkfs.ubifs: More fscryptctl compatibility
      mkfs.ubifs: Move RAND_poll to crypto.c
      mkfs.ubifs: Enable support for building without crypto
      mkfs.ubifs: Print key descriptor only when generated
      mkfs.ubifs: Use AES-256-XTS as default
      mkfs.ubifs: Fix IV selection
      mkfs.ubifs: Store compr_size in correct endianness.
      mkfs.ubifs: Don't compress by default if filesystem is encrypted

Ritesh Harjani (2):
      mkfs.ubifs: add_xattr is not depending on host XATTR support
      mkfs.ubifs: Implement selinux labelling support in mkfs.ubifs.

Sascha Hauer (1):
      mkfs.ubifs: Fix xattr nlink value

Thorsten Glaser (1):
      mtd-utils: Instead of doing preprocessor magic, just output off_t as long long

Yufen Yu (2):
      mtd-utils: avoid to create two UBI_LAYOUT_VOLUME_ID volume
      mtd-utils: fixes double free in mkfs.ubifs


Regards,

David
