From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Jan 2010 14:48:08 +0100
Subject: [Buildroot] [git commit master] qt: ensure libglib2 is built before
	qt if enabled for Qt's glib support
Message-ID: <20100115134832.702BA776C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8086dfa32fafb91102be5b7516088cde9f2b8699
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 4b6876f..a3a466a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -48,6 +48,11 @@ else
 QT_CONFIGURE+= -no-qt3support
 endif
 
+# ensure glib is built first if enabled for Qt's glib support
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT_DEP_LIBS+=libglib2
+endif
+
 
 ### Pixel depths
 QT_PIXEL_DEPTHS := # empty
-- 
1.6.3.3
