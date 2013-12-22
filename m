From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2013 12:09:24 +0100
Subject: [Buildroot] [git commit] squid: drop session external acl helper,
	use file_userip
Message-ID: <20131222111000.E89419C14C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59544198ab2e666c8b7e6b7ded703e2a16b64b59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The session external acl helper needs berkeleydb, switch to the basic
file_userip one which was my original intention (renamed from ip_user in
the 3.3.x series). Fixes:
http://autobuild.buildroot.net/results/635/6359137cde3b293d46df732836b8966d30f23cbc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
