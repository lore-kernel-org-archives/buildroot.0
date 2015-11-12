From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Thu, 12 Nov 2015 13:44:49 +0100
Subject: [Buildroot] [PATCH 1/1] netsniff-ng:override NACL_INC_DIR and
	NACL_LIB_DIR because the default value can cause a wrong build
Message-ID: <1447332289-31940-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/netsniff-ng/netsniff-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 4fed88c..5f0e119 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -8,6 +8,9 @@ NETSNIFF_NG_VERSION = v0.5.9
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
 NETSNIFF_NG_LICENSE = GPLv2
 NETSNIFF_NG_LICENSE_FILES = README COPYING
+NETSNIFF_NG_CONF_ENV = \
+			NACL_INC_DIR=/dev/null \
+			NACL_LIB_DIR=/dev/null
 NETSNIFF_NG_DEPENDENCIES = \
 	libnl libpcap libcli libnetfilter_conntrack \
 	liburcu libnet
@@ -19,6 +22,7 @@ define NETSNIFF_NG_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
 		--prefix=$(TARGET_DIR)/usr \
+		$(NETSNIFF_NG_CONF_ENV) \
 	)
 endef
 
-- 
1.8.3.1
