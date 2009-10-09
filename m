From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove unnecessary call to
	qstrip macro in Makefile
Message-ID: <20091009130115.BEF4D77784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac5d17bf65d41d8dc8e4383cc151f1901e627a25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QT_CONFIGURE can never gain double quotes, so there
is no point to remove some.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6c73e04..015312e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -315,7 +315,6 @@ else
 QT_CONFIGURE+= -no-stl
 endif
 
-QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
 # Figure out what libs to install in the target
-- 
1.6.3.3
