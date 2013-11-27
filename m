From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2013 17:47:43 +0100
Subject: [Buildroot] [git commit] dropwatch: adjust LDFLAGS
Message-ID: <20131127213147.B29B59BD91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ea26acd3d22a1614c2d3233746d792ccaee96f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add more library links into LDFLAGS.
-lncurses because readline uses it (missing _tputs and others).
-lpthread for missing _pthread_rwlock_unlock and others.
-lm for missing _rint.
Fixes:
http://autobuild.buildroot.net/results/6b1/6b1f4f2167d8aca0d73dc0e66fd2e1704c821c61/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropwatch/dropwatch.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 6bbcb23..082b331 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -16,7 +16,8 @@ DROPWATCH_LICENSE_FILES = COPYING
 #
 # Also: always need to add -liberty to hardcoded LDFLAGS for avr32
 DROPWATCH_LDFLAGS = \
-	$(TARGET_LDFLAGS) -lbfd -liberty -lreadline -lnl-3 -lnl-genl-3
+	$(TARGET_LDFLAGS) -lbfd -liberty -lreadline -lnl-3 -lnl-genl-3 \
+		-lpthread -lncurses -lm
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 DROPWATCH_LDFLAGS += -lintl
