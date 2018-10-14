From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Oct 2018 11:01:57 +0200
Subject: [Buildroot] [PATCH v3 5/9] package/libpjsip: disable build of test
 binaries
In-Reply-To: <20181014090202.31122-1-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
Message-ID: <20181014090202.31122-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial revision

 package/libpjsip/libpjsip.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index db9e474be7..b3c439d51c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -67,4 +67,7 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+# disable build of test binaries
+LIBPJSIP_MAKE_OPTS = lib
+
 $(eval $(autotools-package))
-- 
2.19.1
