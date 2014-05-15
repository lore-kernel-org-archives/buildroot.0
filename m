From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 22:40:42 +0200
Subject: [Buildroot] [git commit] package/directfb: Disable dynload when
	BR2_PREFER_STATIC_LIB is enabled
Message-ID: <20140515204429.6C7269CBF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ea2821b42d9c19a2669e02b0a2b43f69a36865e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes http://autobuild.buildroot.net/results/a74/a74b97053d7cad4fcce59f658a4b7b4340284b80/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/directfb.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 1d83a0b..3ae7f3e 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -26,6 +26,11 @@ DIRECTFB_CONF_OPT = \
 	--disable-video4linux \
 	--disable-video4linux2 \
 	--without-tools
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DIRECTFB_CONF_OPT += --disable-dynload
+endif
+
 DIRECTFB_CONFIG_SCRIPTS = directfb-config
 
 DIRECTFB_DEPENDENCIES = freetype zlib
