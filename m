From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:35:00 +0100
Subject: [Buildroot] [git commit] package/v4l2grab: update version to fix
	build
Message-ID: <20151220123524.5FE5081EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5ec50b2cc874a2e8a711792d673f0c51b5142b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v4l2grab uses clock_gettime which is provided by -lrt, so we must check
and link with it.

Also, silence autoreconf when outside a git tree.

Fixes:
    http://autobuild.buildroot.org/results/9df/9df2c09963b97524621f8323b279b8a1672d4b6c/
    http://autobuild.buildroot.org/results/448/4484bda010442033d0536a95f45370701c071f92/
    http://autobuild.buildroot.org/results/b1c/b1ca0c984ec51518a4090039a86a1814582c3c2b/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Volkov Viacheslav <sv99@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/v4l2grab/v4l2grab.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
index 500f0df..b6f26c6 100644
--- a/package/v4l2grab/v4l2grab.mk
+++ b/package/v4l2grab/v4l2grab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2GRAB_VERSION = 0abed72532bee02e545a1924b6883c839d50febf
+V4L2GRAB_VERSION = 6a52a234e227a30e16591d1a0e7afc52a2c5d964
 V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
 V4L2GRAB_LICENSE = GPLv2+
 V4L2GRAB_LICENSE_FILES = LICENSE.md
