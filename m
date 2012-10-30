From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 14:21:21 -0300
Subject: [Buildroot] [PATCH] squid: fix kerberos build failure
Message-ID: <1351617681-4585-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script tries to autodetect kerberos 5 support and seems to
fail under some circumnstances.
Just disable it since we don't have kerberos support in buildroot.
Fixes:
http://autobuild.buildroot.net/results/c9e590a1034c3869cb7391984ce8281ec4c3ef9c/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index fc58fce..1ccb2da 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -16,6 +16,7 @@ SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
 			--with-filedescriptors=1024 --disable-ident-lookups \
+			--with-krb5-config=no \
 			--enable-auth-basic="fake getpwnam" \
 			--enable-auth-digest="file" \
 			--enable-auth-negotiate="wrapper" \
-- 
1.7.8.6
