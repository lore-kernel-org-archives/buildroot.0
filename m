From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Wed, 12 Nov 2014 17:16:30 +0100
Subject: [Buildroot] [PATCH V2 1/4] package/squid: define the log directory,
	pidfile and swapdir
In-Reply-To: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1415808993-2394-2-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/squid/squid.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
1.8.4.5
