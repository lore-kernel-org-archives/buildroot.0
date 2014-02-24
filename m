From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Feb 2014 22:37:39 +0100
Subject: [Buildroot] [PATCH] thrift: needs host-bison and host-flex
Message-ID: <1393277859-7719-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/d46/d46f9097780bdde68ec15f693281ee0b04667f98/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/thrift/thrift.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index d61cc3a..0f6a1d0 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -9,7 +9,7 @@ THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
 HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
-	host-zlib
+	host-zlib host-bison host-flex
 THRIFT_CONF_OPT = --with-sysroot=$(STAGING_DIR) --with-tests=no \
 	--with-boost=$(STAGING_DIR)
 HOST_THRIFT_CONF_OPT = --with-sysroot=$(HOST_DIR) --with-tests=no
-- 
1.8.3.2
