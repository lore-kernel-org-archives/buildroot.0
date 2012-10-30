From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Oct 2012 20:10:31 +0100
Subject: [Buildroot] [git commit] squid: fix kerberos build failure
Message-ID: <20121030191144.CD94D9998D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5718787cd8627cfb73ea7ad3ec7bf6e7e2efc510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script tries to autodetect kerberos 5 support and seems to
fail under some circumnstances.
Just disable it since we don't have kerberos support in buildroot.
Fixes:
http://autobuild.buildroot.net/results/c9e590a1034c3869cb7391984ce8281ec4c3ef9c/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
