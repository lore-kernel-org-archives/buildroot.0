From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Apr 2011 11:09:24 -0300
Subject: [Buildroot] [PATCH 5/5] squid: bump to version 3.1.12
In-Reply-To: <1303135764-20972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303135764-20972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303135764-20972-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump squid to version 3.1.12
Also disable strict error checking since this breaks with gcc 4.6.0+

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e410bd1..9427a79 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.1.11
+SQUID_VERSION = 3.1.12
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
 SQUID_DEPENDENCIES = libcap host-libcap
 SQUID_AUTORECONF = YES
@@ -15,7 +15,7 @@ SQUID_CONF_OPT =	--enable-wccp --enable-wccpv2 --enable-async-io=8 \
 			--enable-htcp --enable-snmp --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
 			--with-filedescriptors=1024 --disable-ident-lookups \
-			--enable-auth="digest" \
+			--enable-auth="digest" --disable-strict-error-checking \
 			--enable-digest-auth-helpers="password" \
 			--enable-external-acl-helpers="ip_user"
 
-- 
1.7.3.4
