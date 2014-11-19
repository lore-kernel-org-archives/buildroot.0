From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 10:02:43 +0100
Subject: [Buildroot] [git commit branch/next] vlc: allow dynamically linking
	live555
Message-ID: <20141119094023.68AF5B4ED0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ee766369ca05964e00a1a1341ec6b5716b7fda5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e2c81d6..19f1058 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -224,9 +224,7 @@ else
 VLC_CONF_OPTS += --disable-libxml2
 endif
 
-# live555 installs a static library only, and vlc tries to link it into a
-# shared library - which doesn't work. So only enable live555 if static.
-ifeq ($(BR2_PACKAGE_LIVE555)$(BR2_PREFER_STATIC_LIB),yy)
+ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
 VLC_CONF_ENV += \
