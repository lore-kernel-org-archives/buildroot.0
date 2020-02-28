From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 00:26:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/lz4: security bump to version 1.9.2
Message-ID: <20200228232626.2387483-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2019-17543: LZ4 before 1.9.2 has a heap-based buffer overflow
  in LZ4_write32 (related to LZ4_compress_destSize), affecting
  applications that call LZ4_compress_fast with a large input. (This
  issue can also lead to data corruption.) NOTE: the vendor states "only
  a few specific / uncommon usages of the API are at risk."
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lz4/lz4.hash | 6 +++---
 package/lz4/lz4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 5477cb6395..01d0107b3f 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256 33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43  lz4-1.8.3.tar.gz
-sha256 d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
+sha256  658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc  lz4-1.9.2.tar.gz
+sha256  d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 70e193c51a..2a658fbba5 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = 1.8.3
+LZ4_VERSION = 1.9.2
 LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
-- 
2.25.0
