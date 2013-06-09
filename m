From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 22:03:54 +0200
Subject: [Buildroot] [git commit] linphone: Disable building with -Werror
Message-ID: <20130609201036.096539AA0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=258bb8e1610e13d2d5dfaeb39fe8291fcabb3558
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass --disable-strict to avoid having -Werror in CFLAGS.
Having -Werror in CFLAGS can lead to build problems depending
on the gcc version that is being used and it should not be used
in released code.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linphone/linphone.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index bbab1e5..2ff678b 100644
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
 
