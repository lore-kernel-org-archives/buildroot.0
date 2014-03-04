From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Mar 2014 13:30:11 -0300
Subject: [Buildroot] [PATCH] eudev: disable manpages
Message-ID: <1393950611-6873-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If host-libxslt or some libxslt is around (xsltproc) eudev will try to
build manpages with it. Problem is docbook DTDs might not be around and
things will break. We want no manpages anyway. Fixes:
http://autobuild.buildroot.net/results/c4e/c4e920b16c57e79df979f00cceaea7c0483f043c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/eudev/eudev.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index ffa413f..95aa1ce 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -15,6 +15,7 @@ EUDEV_AUTORECONF = YES
 EUDEV_CONF_ENV += LIBS=-lrt
 
 EUDEV_CONF_OPT =		\
+	--disable-manpages	\
 	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
 	--libexecdir=/lib	\
-- 
1.8.3.2
