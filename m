From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 01:04:44 +0100
Subject: [Buildroot] [git commit] qt: fix qconfig configure parameter
Message-ID: <20121214000507.2A1959A205@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49f16f4b97abb888e918ce3d70d8a26f03db05c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt configure option for specifying a custom qconfig.h
file changed from -config to -qconfig. This makes the
corresponding change in qt.mk.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index be0808d..b09d0ed 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -24,7 +24,7 @@ endif
 QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
 
 ifneq ($(QT_CONFIG_FILE),)
-QT_CONFIGURE_OPTS += -config buildroot
+QT_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
 QT_CFLAGS = $(TARGET_CFLAGS)
