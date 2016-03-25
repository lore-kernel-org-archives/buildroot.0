From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 21:04:37 +0100
Subject: [Buildroot] [git commit] package/qwt: fix wrong makefile target for
	qt5
Message-ID: <20160325200622.2741281D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60dcd30ade4459b3727b65a482e81bcd42a159ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target name is qt5base, not qt5.

[Peter: extend commit message]
Signed-off-by: David Picard <davepiq@yahoo.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qwt/qwt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 594b141..0bea5f3 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -12,7 +12,7 @@ ifeq ($(BR2_PACKAGE_QT),y)
 QWT_DEPENDENCIES = qt
 QWT_QMAKE = $(QT_QMAKE)
 else ifeq ($(BR2_PACKAGE_QT5),y)
-QWT_DEPENDENCIES += qt5
+QWT_DEPENDENCIES += qt5base
 QWT_QMAKE = $(QT5_QMAKE)
 endif
 
