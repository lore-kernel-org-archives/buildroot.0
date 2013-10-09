From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 09:22:36 -0300
Subject: [Buildroot] [PATCH 2/3] linphone: fix build failure
In-Reply-To: <1381321357-16419-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381321357-16419-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381321357-16419-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script is out of sync causing deplibs linking issues so
recreate it. Fixes:
http://autobuild.buildroot.net/results/006/00673f04d0ce6cb0c5828e68f236a4eb8d7920db/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linphone/linphone.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index a4fc95c..e7e3de6 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -10,7 +10,8 @@ LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer \
 	--disable-strict
-
+# configure is out of sync causing deplibs linking issues
+LINPHONE_AUTORECONF = YES
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 LINPHONE_LICENSE = GPLv2+
 LINPHONE_LICENSE_FILES = COPYING
-- 
1.8.1.5
