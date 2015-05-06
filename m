From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  6 May 2015 15:28:49 +0200
Subject: [Buildroot] [PATCH 1/1] qt: fix missing target
Message-ID: <1430918929-26496-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Fix : 
 http://autobuild.buildroot.net/results/093/09302c153418c3af6dc4cdd12a0149505cfbca0b/
 http://autobuild.buildroot.net/results/96f/96f8a9758f0116aec999028fde1b9c983c143809/

sh target must be provided instead of generic to have the correct QT_NO_FPU
behaviour.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/qt/qt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 919137b..0fd0468 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -224,6 +224,8 @@ else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 QT_EMB_PLATFORM = mips
 else ifeq ($(BR2_powerpc),y)
 QT_EMB_PLATFORM = powerpc
+else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
+QT_EMB_PLATFORM = sh
 else
 QT_EMB_PLATFORM = generic
 endif
-- 
2.3.6
