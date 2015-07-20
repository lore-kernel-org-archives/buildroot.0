From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:56 +0200
Subject: [Buildroot] [PATCH 08/11] package/lttng-tools: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-8-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch is gone
with the commit fb5d605638c359d008329dd9f8fb6c2c8a2c0537.

lttng-tools-no-sync-file-range-in-uclibc.patch is gone
with the commit ed692e2dbbf8d4751d39a636dd1119e829bd0f99.

There is no need to autoreconf lttng-tools.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lttng-tools/lttng-tools.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index e218a95..0cd381c 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -17,8 +17,6 @@ LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
 # trace format into an human readable format.
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
 
-LTTNG_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
 LTTNG_TOOLS_CONF_OPTS += --enable-lttng-ust
 LTTNG_TOOLS_DEPENDENCIES += lttng-libust
-- 
2.4.3
