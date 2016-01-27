From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Jan 2016 10:38:21 -0300
Subject: [Buildroot] [PATCH] ptpd2: explicitly point to pcap-config
Message-ID: <1453901901-26659-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it will search in the usual places, and if the host has
it it will try to build against that one, resulting in failure. Fixes:
http://autobuild.buildroot.net/results/b39/b399ee830de587e3302f86ac0caadd2607c6c43c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ptpd2/ptpd2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index c86db7e..da6a106 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -7,6 +7,7 @@
 PTPD2_VERSION = ptpd-2.3.1
 PTPD2_SITE = $(call github,ptpd,ptpd,$(PTPD2_VERSION))
 PTPD2_DEPENDENCIES = libpcap
+PTPD2_CONF_OPTS = --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
 # configure not shipped
 PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
-- 
2.4.10
