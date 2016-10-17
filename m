From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:37 -0300
Subject: [Buildroot] [PATCH 50/93] lzip: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-51-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lzip/lzip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 60555c5..c5a4983 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -20,7 +20,7 @@ define HOST_LZIP_CONFIGURE_CMDS
 endef
 
 define LZIP_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_LZIP_BUILD_CMDS
@@ -28,7 +28,7 @@ define HOST_LZIP_BUILD_CMDS
 endef
 
 define LZIP_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 define HOST_LZIP_INSTALL_CMDS
-- 
2.7.3
