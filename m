From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:06 -0300
Subject: [Buildroot] [PATCH 19/93] libpfm4: use $(MAKE) rather than make
	directly
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-20-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/libpfm4/libpfm4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 147be7c..358fd9d 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -21,11 +21,11 @@ define LIBPFM4_BUILD_CMDS
 endef
 
 define LIBPFM4_INSTALL_STAGING_CMDS
-	make -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
+	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
 endef
 
 define LIBPFM4_INSTALL_TARGET_CMDS
-	make -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
+	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
