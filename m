From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  6 Feb 2021 21:11:19 +0100
Subject: [Buildroot] [PATCH] package/binutils: bump 2.36.x series to 2.36.1
Message-ID: <20210206201120.2526054-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:

  We are very sorry to have to report that a problem was found with the
  GNU Binutils 2.36 release.  It turns out that it contained a small
  portion of code that was not covered by an FSF copyright assignment.
  So we have created a replacement release - 2.36.1 - with that code
  removed.

  In addition we found that a fix for a theoretical security
  vulnerability[1] was itself broken and could result in the archiver
  program "ar" misbehaving.  So we have chosen to revert the fix from
  the 2.36.1 release whilst the problem is properly resolved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/{2.36 => 2.36.1}/0001-sh-conf.patch          | 0
 .../{2.36 => 2.36.1}/0002-poison-system-directories.patch     | 0
 package/binutils/Config.in.host                               | 4 ++--
 package/binutils/binutils.hash                                | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename package/binutils/{2.36 => 2.36.1}/0001-sh-conf.patch (100%)
 rename package/binutils/{2.36 => 2.36.1}/0002-poison-system-directories.patch (100%)

diff --git a/package/binutils/2.36/0001-sh-conf.patch b/package/binutils/2.36.1/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.36/0001-sh-conf.patch
rename to package/binutils/2.36.1/0001-sh-conf.patch
diff --git a/package/binutils/2.36/0002-poison-system-directories.patch b/package/binutils/2.36.1/0002-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.36/0002-poison-system-directories.patch
rename to package/binutils/2.36.1/0002-poison-system-directories.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8622ebf3f3..d6909617c7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -32,7 +32,7 @@ config BR2_BINUTILS_VERSION_2_35_X
 	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_2_36_X
-	bool "binutils 2.36"
+	bool "binutils 2.36.1"
 	depends on !BR2_csky
 	# https://github.com/uclinux-dev/elf2flt/pull/16
 	# https://github.com/uclinux-dev/elf2flt/issues/12
@@ -55,7 +55,7 @@ config BR2_BINUTILS_VERSION
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.34"		if BR2_BINUTILS_VERSION_2_34_X
 	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
-	default "2.36"		if BR2_BINUTILS_VERSION_2_36_X
+	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 9d48581712..20462b3809 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,7 +2,7 @@
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 sha512  2c7976939dcf5e8c5b7374cccd39bfe803b1bec73c6abfa0eb17c24e1942574c6bdb874c66a092a82adc443182eacd8a5a8001c19a76101f0c7ba40c27de0bbd  binutils-2.34.tar.xz
 sha512  9974ede5978d32e0d68fef23da48fa00bd06b0bff7ec45b00ca075c126d6bbe0cf2defc03ecc3f17bc6cc85b64271a13009c4049d7ba17de26e84e3a6e2c0348  binutils-2.35.2.tar.xz
-sha512  0b89b70d4ad5cfe5bd0011dc7e342ae9de96efdbfc3442a0d6b5f7660e38bbcad36f2c72ba8f074323f02bde022ff1cd723ae99f0ea55cf94ee2dbbc0e4efdb2  binutils-2.36.tar.xz
+sha512  cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9  binutils-2.36.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
-- 
2.29.2
