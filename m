From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:49 -0300
Subject: [Buildroot] [PATCH 42/51] unrar: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-43-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/unrar/unrar.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 68d81b7..f5a95ea 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -11,13 +11,13 @@ UNRAR_LICENSE = unrar
 UNRAR_LICENSE_FILES = license.txt
 
 define UNRAR_BUILD_CMDS
-	$(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
+	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
 		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" \
 		LDFLAGS="$(TARGET_LDFLAGS) -pthread" -C $(@D)
 endef
 
 define UNRAR_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
