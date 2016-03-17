From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 Mar 2016 13:51:12 +0100
Subject: [Buildroot] [PATCH 2/2] libpjsip: disable all bundled third party
	libraries
In-Reply-To: <1458219072-4113-1-git-send-email-luca@lucaceresoli.net>
References: <1458219072-4113-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1458219072-4113-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpjsip bundles several third party libraries. In Buildroot we prefer
either not to build them or to depend on a proper package for each of
them. The current recipe disables most of them, but not all, so
disable the remaining ones.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libpjsip/libpjsip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 56d6f2b..730d9fe 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -24,6 +24,8 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
+	--disable-g7221-codec \
+	--disable-ilbc-codec \
 	--with-external-srtp=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
1.9.1
