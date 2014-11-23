From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 22:18:29 +0100
Subject: [Buildroot] [git commit branch/next] package/squid: enable ICAP
	client support in squid
Message-ID: <20141123211834.10B1D7FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70f8b1d5d81e9fa68a62891f1daf4e1c3561b1eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index ed51881..306b2a3 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -29,7 +29,8 @@ SQUID_CONF_OPTS =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-external-acl-helpers="file_userip" \
 			--with-logdir=/var/log/squid/ \
 			--with-pidfile=/var/run/squid.pid \
-			--with-swapdir=/var/cache/squid/
+			--with-swapdir=/var/cache/squid/ \
+			--enable-icap-client
 
 # On uClibc librt needs libpthread
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
