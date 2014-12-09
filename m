From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Dec 2014 16:13:05 -0300
Subject: [Buildroot] [PATCH] thrift: disable tutorial(s)
Message-ID: <1418152385-21365-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tutorials don't pass pedantic mode hence causing failures.
And we don't care about tutorials anyway, disable them to save time as
well. Fixes.
http://autobuild.buildroot.net/results/f68/f68d537e623f565000ca966372a7c0277f4e3888/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/thrift/thrift.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 5c350dd..955e9ec 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -12,9 +12,11 @@ HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
 	host-zlib host-bison host-flex
 THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
 	--with-boost=$(STAGING_DIR) \
-	--disable-tests
+	--disable-tests \
+	--disable-tutorial
 HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
-	--disable-tests
+	--disable-tests \
+	--disable-tutorial
 THRIFT_AUTORECONF = YES
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
-- 
2.0.4
