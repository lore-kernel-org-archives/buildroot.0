From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 20:39:56 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] ghostscript: security
 bump to version 9.25
Message-ID: <20181005183911.E4FEA8D4B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25e9a27a77be9ed1022c86c75b1b5c38e2bdacb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security issues:

- CVE-2018-16543: In Artifex Ghostscript before 9.24, gssetresolution and
  gsgetresolution allow attackers to have an unspecified impact

- CVE-2018-17183: Artifex Ghostscript before 9.25 allowed a user-writable
  error exception table, which could be used by remote attackers able to
  supply crafted PostScript to potentially overwrite or replace error
  handlers to inject code.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b054797ecafec2b4b8945ad654242133749bf653)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index bb41841012..f8ca6c8d4e 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs923/SHA512SUMS
-sha512 0c1f59b743f92f9cf7000b06f6209010e583ef4d6899c20ed245721dea3c08fd58b9e2d1513fe83765ab6be233bc7ab250cf18054e4d09de4073b1111e38035f  ghostscript-9.23.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs925/SHA512SUMS
+sha512 7a1c0b7546ed523f50c1452d4a1c13fcf043d6060fc9708bbc4b543f66ecb1b619b6e71998094ac702ef44a2fd159b6523271de19b1cae352981ef51fb637651  ghostscript-9.25.tar.xz
 
 # Hash for license file:
 sha256 6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 8ea6610be5..9b5e144888 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.23
-GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs923
+GHOSTSCRIPT_VERSION = 9.25
+GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs925
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
