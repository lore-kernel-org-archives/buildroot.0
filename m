From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Sep 2018 22:52:08 +0200
Subject: [Buildroot] [PATCH 1/1] file: bump to version 5.34
Message-ID: <20180909205208.30737-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ding-past-the-end-of-buffer-Rui-Reis.patch | 30 -------------------
 package/file/file.hash                        |  2 +-
 package/file/file.mk                          |  2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch

diff --git a/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch b/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch
deleted file mode 100644
index daff866692..0000000000
--- a/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a642587a9c9e2dd7feacdf513c3643ce26ad3c22 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Sat, 9 Jun 2018 16:00:06 +0000
-Subject: [PATCH] Avoid reading past the end of buffer (Rui Reis)
-
-[baruch: drop file version string update hunk]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit a642587a9c9 in github mirror
-
- src/readelf.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/readelf.c b/src/readelf.c
-index 79c83f9f5048..1f41b46113c3 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -842,7 +842,8 @@ do_core_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
- 
- 				cname = (unsigned char *)
- 				    &nbuf[doff + prpsoffsets(i)];
--				for (cp = cname; *cp && isprint(*cp); cp++)
-+				for (cp = cname; cp < nbuf + size && *cp
-+				    && isprint(*cp); cp++)
- 					continue;
- 				/*
- 				 * Linux apparently appends a space@the end
--- 
-2.17.1
-
diff --git a/package/file/file.hash b/package/file/file.hash
index a6b40be349..c279dff6e1 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 1c52c8c3d271cd898d5511c36a68059cda94036111ab293f01f83c3525b737c6  file-5.33.tar.gz
+sha256 f15a50dbbfa83fec0bd1161e8e191b092ec832720e30cd14536e044ac623b20a  file-5.34.tar.gz
 sha256 3c0ad13c36f891a9b4f951e59eb2fc108065a46f849697cc6fd3cdb41cc23a3d  COPYING
 sha256 d98ee4d8d95e7d021a5dfc41f137ecc3b624a7b98e8bd793130202d12a21ed57  src/mygetopt.h
 sha256 85e358d575ad4ac5b38b623a25b24246ccff3c7e680d930c0a9ff5228fe434b6  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index 422e29b1ce..42131c4888 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.33
+FILE_VERSION = 5.34
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
-- 
2.17.1
