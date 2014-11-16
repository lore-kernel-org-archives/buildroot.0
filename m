From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 22:48:15 +0100
Subject: [Buildroot] [git commit] package/duma: add missing define when
	installing
Message-ID: <20141116221147.51C548912D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08c6909b711d516981f2f8225483d07473ca8220
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3ab9774 (package/duma: do not let Makefile guess OS) added a
define to not let duma's build system guess the OS, mostly to avoid a
warning, but forgot to add that same define to the install commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/duma/duma.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
