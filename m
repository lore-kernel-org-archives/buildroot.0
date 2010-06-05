From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  5 Jun 2010 20:03:48 +0200
Subject: [Buildroot] [PATCH 2/4] gstreamer: Added host-flex and host-bison
	dependencies
In-Reply-To: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1275761030-20955-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

As stated by config.log from gstreamer :

configure:17368: found /home/djdeath/src/buildroot/buildroot_rebase/canmore/host/usr/bin/bison
configure:17381: result: /home/djdeath/src/buildroot/buildroot_rebase/canmore/host/usr/bin/bison
configure:17397: checking bison version 2.3 >= 1.875
configure:17401: result: yes
configure:17412: checking for flex
configure:17430: found /home/djdeath/src/buildroot/buildroot_rebase/canmore/host/usr/bin/flex
configure:17443: result: /home/djdeath/src/buildroot/buildroot_rebase/canmore/host/usr/bin/flex
configure:17459: checking flex version 2.5.35 >= 2.5.31
configure:17473: result: yes

Flex and Bison are required to build GstParse (used to parse gst-launch command line arguments).

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 0391b14..226a4ef 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -21,7 +21,7 @@ GSTREAMER_CONF_OPT = \
 		--disable-tests \
 		--disable-failing-tests
 
-GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
+GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_GSTREAMER_LIBXML2),y)
 GSTREAMER_DEPENDENCIES += libxml2
-- 
1.7.1
