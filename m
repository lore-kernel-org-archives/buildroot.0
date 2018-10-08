From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:09:29 +0200
Subject: [Buildroot] [git commit] package/x264: bump version to 20181002-2245
Message-ID: <20181008160918.8EBA78E456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32596aec4f691e632ea91a8d12dc35d421a3e7e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to upstream provided tarball of the git repo.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index dd84794366..da4ff5945d 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0c43680b516f76fe3b9ecbe0efc7c2a763987213051c16c248f506851aebe6c7  x264-303c484ec828ed0d8bfe743500e70314d026c3bd.tar.gz
+sha256 94a67986dcb2c659752df767e81fd59a494fb7fb5c9d4fc8aff4f004353a42df  x264-snapshot-20181002-2245.tar.bz2
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 31304b9eae..d529871a8d 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-X264_VERSION = 303c484ec828ed0d8bfe743500e70314d026c3bd
-X264_SITE = git://git.videolan.org/x264.git
+X264_VERSION = 20181002-2245
+X264_SITE = http://download.videolan.org/x264/snapshots
+X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
 X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
 X264_LICENSE_FILES = COPYING
