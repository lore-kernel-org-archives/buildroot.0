From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Tue, 18 Nov 2014 15:54:45 +0100
Subject: [Buildroot] [PATCH V3 3/5] package/squid: enable ICAP client
	support in squid
In-Reply-To: <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1416322487-14247-4-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/squid/squid.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b0fa69f..cd4090e 100644
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
-- 
1.8.4.5
