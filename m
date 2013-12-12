From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:01 -0600
Subject: [Buildroot] [ PATCH v4 01/20] pcre: Add host build support
In-Reply-To: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1386872840-22051-2-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v3 -> v4:
  - No changes.
Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by Thomas).
Changes v1 -> v2:
  - No changes
---
 package/pcre/pcre.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 2637354..000ce54 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -23,3 +23,4 @@ PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
