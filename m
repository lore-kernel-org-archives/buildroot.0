From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 15:04:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/duma: add missing define when
	installing
In-Reply-To: <1416146673-29582-1-git-send-email-yann.morin.1998@free.fr>
References: <1416146673-29582-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1416146673-29582-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3ab9774 (package/duma: do not let Makefile guess OS) added a
define to not let duma's build system guess the OS, mostly to avoid a
warning, but forgot to add that same define to the install commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/duma/duma.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 6e730f9..5e862ab 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -25,11 +25,11 @@ define DUMA_BUILD_CMDS
 endef
 
 define DUMA_INSTALL_STAGING_CMDS
-	$(MAKE) prefix=$(STAGING_DIR)/usr install -C $(@D)
+	$(MAKE) OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
 define DUMA_INSTALL_TARGET_CMDS
-	$(MAKE) prefix=$(TARGET_DIR)/usr install -C $(@D)
+	$(MAKE) OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
