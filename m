From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:42:52 +0100
Subject: [Buildroot] [git commit] qt5base: support debug or release modes
Message-ID: <20130310215507.908DC9AFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c64cfee04325dbcc57028885cbaf278dddca451d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cad7b8d..33555ae 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -41,6 +41,12 @@ QT5BASE_CONFIGURE_OPTS += \
 	-system-pcre \
 	-no-pch
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+QT5BASE_CONFIGURE_OPTS += -debug
+else
+QT5BASE_CONFIGURE_OPTS += -release
+endif
+
 ifeq ($(BR2_LARGEFILE),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
 else
