From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:34 +0200
Subject: [Buildroot] [PATCH 11/23] qt: remove unnecessary call to qstrip
	macro in Makefile
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-12-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QT_CONFIGURE can never gain double quotes, so there
is no point to remove some.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 47009e8..9d80437 100644
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
