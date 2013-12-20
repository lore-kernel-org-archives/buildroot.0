From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Dec 2013 22:12:13 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.4.1
Message-ID: <20131220212714.CE4029C13E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d738fc6b441e0ba53dfd8fb76c93ca247f02ee67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New for 3.4 series:
* SSL Server Certificate Validator
* Multicast DNS
* Transaction Annotations

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e1b37be..1a22cbc 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQUID_VERSION_MAJOR = 3.3
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).11
+SQUID_VERSION_MAJOR = 3.4
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).1
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
@@ -25,7 +25,7 @@ SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-auth-negotiate="wrapper" \
 			--enable-auth-ntlm="fake" \
 			--disable-strict-error-checking \
-			--enable-external-acl-helpers="ip_user"
+			--enable-external-acl-helpers="session"
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
