From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:33:06 +0200
Subject: [Buildroot] [git commit] qt: fix missing target
Message-ID: <20150506193318.EB6D181DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7ac95b8db400e766acdcfe9b1da1c92fed3ace5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix :
 http://autobuild.buildroot.net/results/093/09302c153418c3af6dc4cdd12a0149505cfbca0b/
 http://autobuild.buildroot.net/results/96f/96f8a9758f0116aec999028fde1b9c983c143809/

sh target must be provided instead of generic to have the correct QT_NO_FPU
behaviour.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d1615ae..035ca3a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -219,6 +219,8 @@ else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 QT_EMB_PLATFORM = mips
 else ifeq ($(BR2_powerpc),y)
 QT_EMB_PLATFORM = powerpc
+else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
+QT_EMB_PLATFORM = sh
 else
 QT_EMB_PLATFORM = generic
 endif
