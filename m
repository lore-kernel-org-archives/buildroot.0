From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 7 Jun 2013 16:04:30 +0100
Subject: [Buildroot] [PATCH] linphone: Disable building with -Werror
Message-ID: <1370617470-16073-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Pass --disable-strict to avoid having -Werror in CFLAGS.
Having -Werror in CFLAGS can lead to build problems depending
on the gcc version that is being used and it should not be used
in released code.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/linphone/linphone.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index efe70a9..5fa92c0 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -8,7 +8,8 @@ LINPHONE_VERSION = 3.5.2
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
 LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
-	--enable-external-mediastreamer
+	--enable-external-mediastreamer \
+	--disable-strict
 
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 
-- 
1.8.2.1
