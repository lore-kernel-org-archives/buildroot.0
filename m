From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 20:32:47 +0100
Subject: [Buildroot] [git commit] openocd: pass --disable-werror to fix
	build issues
Message-ID: <20150102193312.8C59780D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b937ae4a07fe19f690de1c07851da9cdb0294bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should fix:

  http://autobuild.buildroot.org/results/91d/91d2ae34f14f1978e0985e75f803055d51201a93/

and similar build problems.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openocd/openocd.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b0bcb7e..c67691c 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -16,7 +16,8 @@ OPENOCD_CONF_OPTS = \
 	--disable-doxygen-html \
 	--with-jim-shared=no \
 	--disable-shared \
-	--enable-dummy
+	--enable-dummy \
+	--disable-werror
 
 # Rely on the Config.in options of each individual adapter selecting
 # the dependencies they need.
@@ -93,7 +94,8 @@ HOST_OPENOCD_CONF_OPTS = \
 	--disable-doxygen-html \
 	--with-jim-shared=no \
 	--disable-shared \
-	--enable-dummy
+	--enable-dummy \
+	--disable-werror
 
 HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
 
