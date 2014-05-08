From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  9 May 2014 01:05:13 +0200
Subject: [Buildroot] [PATCH 2/2] openpowerlink: add Intel I210 chip support
In-Reply-To: <1399590313-30617-1-git-send-email-romain.naour@openwide.fr>
References: <1399590313-30617-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1399590313-30617-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink/Config.in        | 3 +++
 package/openpowerlink/openpowerlink.mk | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 8573961..d87f8be 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -60,6 +60,9 @@ config BR2_PACKAGE_OPENPOWERLINK_82573
 config BR2_PACKAGE_OPENPOWERLINK_8255x
 	bool "Intel 8255x"
 
+config BR2_PACKAGE_OPENPOWERLINK_I210
+	bool "Intel I210"
+
 config BR2_PACKAGE_OPENPOWERLINK_RTL8139
 	bool "Realtek RTL-8139"
 
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 0aae544..152f014 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -51,10 +51,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
 OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=82573
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8139
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_8255x),y)
 OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8255x
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_I210),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=I210
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
+OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8139
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_MN),y)
-- 
1.9.0
