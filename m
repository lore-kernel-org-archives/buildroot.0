From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 20 Jul 2013 11:24:48 +0200
Subject: [Buildroot] [PATCH 1/1] ebtables: fix download url
Message-ID: <1374312289-18436-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ebtables/ebtables.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 0b3fba6..ddc1f45 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -6,7 +6,7 @@
 
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
-EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(EBTABLES_VERSION)
+EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))
 EBTABLES_LICENSE = GPLv2
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
-- 
1.7.9.5
