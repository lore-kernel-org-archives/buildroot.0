From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 09:06:19 -0300
Subject: [Buildroot] [PATCH] dropwatch: adjust LDFLAGS
Message-ID: <1385553979-25760-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add more library links into LDFLAGS.
-lncurses because readline uses it (missing _tputs and others).
-lpthread for missing _pthread_rwlock_unlock and others.
-lm for missing _rint.
Fixes:
http://autobuild.buildroot.net/results/6b1/6b1f4f2167d8aca0d73dc0e66fd2e1704c821c61/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropwatch/dropwatch.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.3.2
