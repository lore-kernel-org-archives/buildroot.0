From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:48 +0100
Subject: [Buildroot] [PATCH 09/12] package/murata-cyw-fw: add missing
 extract dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

murata-cyw-fw uses suitable-extractor to manually extract a tarball,
so it should have the appropriate package dependencies added to
<pkg>_EXTRACT_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/murata-cyw-fw/murata-cyw-fw.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/murata-cyw-fw/murata-cyw-fw.mk b/package/murata-cyw-fw/murata-cyw-fw.mk
index b99168b875..ea4f3fcc34 100644
--- a/package/murata-cyw-fw/murata-cyw-fw.mk
+++ b/package/murata-cyw-fw/murata-cyw-fw.mk
@@ -22,6 +22,9 @@ define MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
 	)
 endef
 MURATA_CYW_FW_POST_EXTRACT_HOOKS += MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
+MURATA_CYW_FW_EXTRACT_DEPENDENCIES += \
+	$(foreach tar,$(notdir $(MURATA_CYW_FW_EXTRA_DOWNLOADS)),\
+		$(call extractor-pkg-dependency,$(tar)))
 
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43012) += \
 	brcmfmac43012-sdio.bin \
-- 
2.23.0
