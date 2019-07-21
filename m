From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Date: Sun, 21 Jul 2019 23:32:58 +0200
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.1.1 is released
Message-ID: <805d5408-af93-43e4-6615-1ee0c7ca9dc3@sigma-star.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

mtd-utils-2.1.1 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.1.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.1.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.1


This release contains primarily bug fixes following the 2.1.0 release that
introduced a number of new features. Most importantly, one of the fixes
contained address a problem building mkfs.ubifs with file encryption disabled,
hence the push for an earlier release despite only a small number of commits
since 2.1.0.

On the side of features, optional support for zstd compression has been added
to mkfs.ubifs now that it is supported in UBIFS on the kernel side.

With a newer gcc version, the build is now spewing warnings again. So currently
work is on the way to address this (and also issues reported by static
analysis), so the next release will probably be another patch level increment
again, most likely before the end of the year.


Changes from 2.1.0 to 2.1.1:

Features:
 - mkfs.ubifs: Add ZSTD compression

Fixes:
 - ubiformat: Dont ignore sequence number CLI option
 - mkfs.ubifs: fix build without openssl
 - mkfs.ubifs: fix regression when trying to store device special files
 - mkfs.ubifs: fix description of favor_lzo
 - unittests/test_lib: Include proper header for _IOC_SIZE
 - unittests/libmtd_test: Include fcntl header
 - unittests: Define the use of _GNU_SOURCE
 - ubinize: Exit with non-zero exit code on error.
 - mtd-tests: nandbiterrs: Fix issue that just insert error at bit 7
 - ubi-tests: ubi_mkvol_request: Fully initialize 'struct ubi_mkvol_request req'
 - ubi-tests: io_read: Filter invalid offset value before 'lseek' in io_read test
 - ubi-tests: mkvol test: Checks return value 'ENOSPC' for 'ubi_mkvol'
 - ubi-tests: fm_param: Replace 'fm_auto' with 'fm_autoconvert'



Raw short log since the 2.1.0 release:

Amol Vengurlekar (1):
      ubiformat: Dont ignore sequence number CLI option

Baruch Siach (1):
      mkfs.ubifs: fix build without openssl

David Oberhollenzer (2):
      mkfs.ubifs: fix regression when trying to store device special files
      mkfs.ubifs: remove ZSTD_CLEVEL_DEFAULT for backwards compatibillity

Martin Kaiser (1):
      mkfs.ubifs: fix compilation without ZSTD

Olliver Schinagl (3):
      unittests/test_lib: Include proper header for _IOC_SIZE
      unittests/libmtd_test: Include fcntl header
      unittests: Define the use of _GNU_SOURCE

Patrick Doyle (1):
      ubinize: Exit with non-zero exit code on error.

Sebastian Andrzej Siewior (1):
      mkfs.ubifs: Add ZSTD compression

Uwe Kleine-K?nig (1):
      mkfs.ubifs: fix description of favor_lzo

Xiaolei Li (1):
      mtd-tests: nandbiterrs: Fix issue that just insert error at bit 7

Zhihao Cheng (4):
      ubi-tests: ubi_mkvol_request: Fully initialize 'struct ubi_mkvol_request req'
      ubi-tests: io_read: Filter invalid offset value before 'lseek' in io_read test
      ubi-tests: mkvol test: Checks return value 'ENOSPC' for 'ubi_mkvol'
      ubi-tests: fm_param: Replace 'fm_auto' with 'fm_autoconvert'


Regards,

David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190721/24b741f8/attachment.asc>
