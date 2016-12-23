From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Dec 2016 11:26:05 +0100
Subject: [Buildroot] [git commit] util-linux: attempt to fix host-util-linux
	build
Message-ID: <20161223102626.DB4F481813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fadda7adc7291eb355382d0f05677a92f9c3d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should fix:

  http://autobuild.buildroot.net/results/65595aa787498087a9a85c9cd19135396b246afb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index bec6993..51ece90 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -150,6 +150,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--enable-libmount \
 	--enable-libuuid \
 	--without-ncurses \
+	--without-ncursesw \
 	--without-tinfo
 
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
