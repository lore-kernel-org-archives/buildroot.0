From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 13 Dec 2013 09:02:25 +0800
Subject: [Buildroot] [PATCH v2 2/2] xl2tp: bump to version 1.3.2
In-Reply-To: <1386896468.9372.1.camel@phoenix>
References: <1386896468.9372.1.camel@phoenix>
Message-ID: <1386896545.9372.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
v2: select BR2_PACKAGE_OPENSSL to fix build error.
 package/xl2tp/Config.in | 1 +
 package/xl2tp/xl2tp.mk  | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index 7e2d2f6..f0b1e83 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 07634a0..3e99a2e 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.1
+XL2TP_VERSION = v1.3.2
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
-XL2TP_DEPENDENCIES = libpcap
+XL2TP_DEPENDENCIES = libpcap openssl
 XL2TP_LICENSE = GPLv2+
 XL2TP_LICENSE_FILES = LICENSE
 
-- 
1.8.1.2
