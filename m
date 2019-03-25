From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:35:30 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/file: security
 bump to version 5.36
Message-ID: <20190325163207.0E38E8152C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44b651a4fdf90f25f5cf4a16f0b9374056fb6e93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

CVE-2019-8906: do_core_note in readelf.c in libmagic.a in file 5.35 has
an out-of-bounds read because memcpy is misused.

CVE-2019-8904: do_bid_note in readelf.c in libmagic.a in file 5.35 has a
stack-based buffer over-read, related to file_printf and file_vprintf.

Update license files hashes; removal of trailing white spaces.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 14d6e6df7bcfd7d46811a812610ec87b0b249088)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.hash | 12 +++++++-----
 package/file/file.mk   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index c279dff6e1..7948e856ee 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,5 +1,7 @@
-# Locally calculated
-sha256 f15a50dbbfa83fec0bd1161e8e191b092ec832720e30cd14536e044ac623b20a  file-5.34.tar.gz
-sha256 3c0ad13c36f891a9b4f951e59eb2fc108065a46f849697cc6fd3cdb41cc23a3d  COPYING
-sha256 d98ee4d8d95e7d021a5dfc41f137ecc3b624a7b98e8bd793130202d12a21ed57  src/mygetopt.h
-sha256 85e358d575ad4ac5b38b623a25b24246ccff3c7e680d930c0a9ff5228fe434b6  src/vasprintf.c
+# Locally calculated after verifying signature
+# ftp://ftp.astron.com/pub/file/file-5.36.tar.gz.asc
+# using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
+sha256 fb608290c0fd2405a8f63e5717abf6d03e22e183fb21884413d1edd918184379  file-5.36.tar.gz
+sha256 0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
+sha256 4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
+sha256 7ac061e1a1c840c4dfa0573aec6f3497676c9295b5ec4190d3576646eb1646bf  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index b5b12978bc..1a835015a7 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.34
+FILE_VERSION = 5.36
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
