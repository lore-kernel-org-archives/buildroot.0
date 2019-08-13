From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Aug 2019 21:23:39 +0200
Subject: [Buildroot] [PATCH 2/3] package/libdnet: fix dnet-config
In-Reply-To: <20190813192340.21989-1-fontaine.fabrice@gmail.com>
References: <20190813192340.21989-1-fontaine.fabrice@gmail.com>
Message-ID: <20190813192340.21989-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dnet-config to LIBDNET_CONFIG_SCRIPTS so this script can be used by
applications such as tcpreplay

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdnet/libdnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 00d9c4fd40..d1cc0bf150 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -13,6 +13,7 @@ LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-check=no
+LIBDNET_CONFIG_SCRIPTS = dnet-config
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
 LIBDNET_DEPENDENCIES = python
-- 
2.20.1
