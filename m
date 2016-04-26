From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 26 Apr 2016 13:02:39 +0100
Subject: [Buildroot] [PATCH 1/2] ipmitool: explicitly enable lanplus when
	selected
Message-ID: <1461672160-1596-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ipmitool/ipmitool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index f476ae9..60ef2f8 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -15,6 +15,7 @@ IPMITOOL_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
+IPMITOOL_CONF_OPTS += --enable-intf-lanplus
 else
 IPMITOOL_CONF_OPTS += --disable-intf-lanplus
 endif
-- 
2.7.3
