From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:23:31 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/lz4: security
 bump to version 1.9.2
Message-ID: <20200314171107.B28A1838D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=189261d28f550649f4a3d7f46f070fef90e632a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2019-17543: LZ4 before 1.9.2 has a heap-based buffer overflow
  in LZ4_write32 (related to LZ4_compress_destSize), affecting
  applications that call LZ4_compress_fast with a large input. (This
  issue can also lead to data corruption.) NOTE: the vendor states "only
  a few specific / uncommon usages of the API are at risk."
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4390b365a2dfc4cea5505d44955b2fdef816b2e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/lz4.hash | 6 +++---
 package/lz4/lz4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 691ec6c42a..01d0107b3f 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256 33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43  lz4-v1.8.3.tar.gz
-sha256 d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
+sha256  658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc  lz4-1.9.2.tar.gz
+sha256  d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index a7152cb531..2a658fbba5 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LZ4_VERSION = v1.8.3
-LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
+LZ4_VERSION = 1.9.2
+LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
