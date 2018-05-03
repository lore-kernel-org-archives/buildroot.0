From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 22:07:23 +0200
Subject: [Buildroot] [git commit] ghostscript: bump to version 9.23
Message-ID: <20180503200725.791098B562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60c4bd8ba4b0282d9c4549ade485def414959e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove sha256 (not provided anymore) and keep only sha512
- Update patch
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ghostscript/0001-Fix-cross-compilation-issue.patch | 4 ++++
 package/ghostscript/ghostscript.hash                       | 9 +++++----
 package/ghostscript/ghostscript.mk                         | 4 ++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/ghostscript/0001-Fix-cross-compilation-issue.patch b/package/ghostscript/0001-Fix-cross-compilation-issue.patch
index 57e1be61ca..a13c7f8381 100644
--- a/package/ghostscript/0001-Fix-cross-compilation-issue.patch
+++ b/package/ghostscript/0001-Fix-cross-compilation-issue.patch
@@ -9,7 +9,10 @@ x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '
 Downloaded from
 http://bugs.ghostscript.com/show_bug.cgi?id=696508#c3
 
+Slightly updated to work with 9.23
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -24,6 +27,7 @@ index d0f62d7..0d49344 100644
  LIBTIFFDIR='src'
 -LIBTIFFCONFDIR=''
 +LIBTIFFCONFDIR='src'
+ TIFFCFLAGS=''
  
  TIFFDEVS_ALL='tiffs tiff12nc tiff24nc tiff48nc tiff32nc tiff64nc tiffcrle tifflzw tiffpack tiffgray tiffsep tiffsep1 tiffscaled tiffscaled4 tiffscaled8 tiffscaled24 tiffscaled32'
  FAX_DEVS_ALL='cfax dfaxlow dfaxhigh fax faxg3 faxg32d faxg4 tiffg3 tiffg32d tiffg4 tfax'
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 2b36e34831..bb41841012 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,4 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/SHA256SUMS
-sha256 c1f862e6f40f997dbe3feba89355e8cb05d55818994e10f4932b0dd9b627d1bb  ghostscript-9.22.tar.xz
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/SHA512SUMS
-sha512 67739ace64090ab1951cba4cb011a5a6829ee60b32ba4157d0f17e744e345ea268335304db6722677ae33565ea5b696c2ff7b889d42a463acf2933c8230523d4  ghostscript-9.22.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs923/SHA512SUMS
+sha512 0c1f59b743f92f9cf7000b06f6209010e583ef4d6899c20ed245721dea3c08fd58b9e2d1513fe83765ab6be233bc7ab250cf18054e4d09de4073b1111e38035f  ghostscript-9.23.tar.xz
+
+# Hash for license file:
+sha256 6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index aa3f63b26e..71bfa2ce49 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.22
-GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922
+GHOSTSCRIPT_VERSION = 9.23
+GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs923
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
