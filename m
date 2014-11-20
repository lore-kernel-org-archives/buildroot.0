From: Damien Lanson <damien@kal-host.com>
Date: Thu, 20 Nov 2014 17:02:08 +0100
Subject: [Buildroot] [PATCH 1/1] Disable sample xerces
Message-ID: <1416499328-13083-1-git-send-email-damien@kal-host.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

New try to send a patch with git send-email. This patch remove building and
installing sample for xerces. If it's good, I have other patch to remove
building and/or installing of sample or example or dev file in some package.

Best Regards,

-- 
Damien Lanson / Research and Development Engineer
ZeeTim
15 b rue Frederic Joliot Currie, FR 94400 Vitry-sur-Seine
www.zeetim.com


Signed-off-by: Damien Lanson <damien@kal-host.com>
---
 package/xerces/xerces.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 36955e3..1beaf21 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -11,6 +11,13 @@ XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
+
+define XERCES_DISABLE_SAMPLES
+	$(SED) 's/ samples//' $(@D)/Makefile.in
+endef
+
+XERCES_POST_PATCH_HOOKS += XERCES_DISABLE_SAMPLES
+
 XERCES_CONF_OPTS = --disable-threads \
 		  --with-gnu-ld
 
-- 
1.7.10.4
