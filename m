From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Dec 2013 08:02:25 -0300
Subject: [Buildroot] [PATCH] squid: drop session external acl helper,
	use file_userip
Message-ID: <1387710145-27841-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The session external acl helper needs berkeleydb, switch to the basic
file_userip one which was my original intention (renamed from ip_user in
the 3.3.x series). Fixes:
http://autobuild.buildroot.net/results/635/6359137cde3b293d46df732836b8966d30f23cbc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 1a22cbc..0b303dd 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -25,7 +25,7 @@ SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-auth-negotiate="wrapper" \
 			--enable-auth-ntlm="fake" \
 			--disable-strict-error-checking \
-			--enable-external-acl-helpers="session"
+			--enable-external-acl-helpers="file_userip"
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
-- 
1.8.3.2
