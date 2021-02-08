From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  8 Feb 2021 11:10:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: set CONNMAN_CPE_ID_VENDOR
Message-ID: <20210208101034.6098-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:intel:connman is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/702658?namingFormat=2.3&orderBy=CPEURI&keyword=connman&status=FINAL

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/connman/connman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 23e7cb7797..e1ef49fa7c 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -11,6 +11,7 @@ CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
+CONNMAN_CPE_ID_VENDOR = intel
 
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
-- 
2.30.0
