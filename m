From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 17:09:49 -0300
Subject: [Buildroot] [PATCH 6/6] openswan: fix OCF support detection
In-Reply-To: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1367093389-23877-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the openssl OCFs option is gone we need to switch to the package
option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 153d659..6b7dc05 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -22,7 +22,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	OPENSWAN_DEPENDENCIES += openssl
 	OPENSWAN_MAKE_OPT += HAVE_OPENSSL=true
-ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
+ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
 	OPENSWAN_MAKE_OPT += HAVE_OCF=true
 endif
 endif
-- 
1.8.1.5
