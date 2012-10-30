From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 30 Oct 2012 11:36:05 +0000
Subject: [Buildroot] [PATCH] matchbox-desktop: Append -ldl to the linker
Message-ID: <1351596965-20672-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Fixes building with binutils-2.22

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 5c518e5..bd64680 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -9,6 +9,7 @@ MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
 MATCHBOX_DESKTOP_SITE = http://matchbox-project.org/sources/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION)
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
+MATCHBOX_DESKTOP_CONF_ENV = LIBS="-ldl"
 
 #############################################################
 
-- 
1.7.1
