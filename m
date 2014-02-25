From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Feb 2014 09:55:28 -0300
Subject: [Buildroot] [PATCH] thrift: needs host-bison
Message-ID: <1393332928-28879-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d46/d46f9097780bdde68ec15f693281ee0b04667f98/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/thrift/thrift.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index d61cc3a..728a67a 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -6,10 +6,11 @@
 
 THRIFT_VERSION = 0.9.1
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
-THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
+THRIFT_DEPENDENCIES = host-bison host-pkgconf host-thrift boost libevent \
+	openssl zlib
 THRIFT_INSTALL_STAGING = YES
 HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
-	host-zlib
+	host-zlib host-bison
 THRIFT_CONF_OPT = --with-sysroot=$(STAGING_DIR) --with-tests=no \
 	--with-boost=$(STAGING_DIR)
 HOST_THRIFT_CONF_OPT = --with-sysroot=$(HOST_DIR) --with-tests=no
-- 
1.8.3.2
