From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 22:16:39 +0100
Subject: [Buildroot] [git commit] package/squid: define the log directory,
	pidfile and swapdir
Message-ID: <20141201104838.2D7E17FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d29eb641d3e50e734496ddb2db4aed4e7d63cfbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e8a2ccc..ed51881 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -26,7 +26,10 @@ SQUID_CONF_OPTS =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-auth-negotiate="wrapper" \
 			--enable-auth-ntlm="fake" \
 			--disable-strict-error-checking \
-			--enable-external-acl-helpers="file_userip"
+			--enable-external-acl-helpers="file_userip" \
+			--with-logdir=/var/log/squid/ \
+			--with-pidfile=/var/run/squid.pid \
+			--with-swapdir=/var/cache/squid/
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
