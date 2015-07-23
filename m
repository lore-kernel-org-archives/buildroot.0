From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu, 23 Jul 2015 10:45:47 +0200
Subject: [Buildroot] [PATCH V2] c-icap: fix config script by adding
	$(STAGING_DIR) prefix to link path. It fixes c-icap-modules build.
In-Reply-To: <20150722155117.46a0e983@free-electrons.com>
References: <20150722155117.46a0e983@free-electrons.com>
Message-ID: <1437641147-6894-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/c-icap/c-icap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 0f42b6c..0e27cc4 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -57,6 +57,7 @@ define C_ICAP_TUNE_INSTALLATION
 		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
 	$(SED) 's%INCDIR2=.*%INCDIR2=$(STAGING_DIR)/usr/include/c_icap%' \
 		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
+	$(SED) 's%-L$$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config
 endef
 
 C_ICAP_POST_INSTALL_TARGET_HOOKS += C_ICAP_TUNE_INSTALLATION
-- 
1.8.4.5
