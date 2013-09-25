From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 25 Sep 2013 14:32:36 -0500
Subject: [Buildroot] [PATCH v3 01/16] pcre: Add host build support
In-Reply-To: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1380137571-688-2-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v2 -> v3:
  - Changed order of patch to correct dependency issue (suggested by Thomas).
Changes v1 -> v2:
  - No changes

 package/pcre/pcre.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index bf86a3d..1b59dbc 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -21,3 +21,4 @@ PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
