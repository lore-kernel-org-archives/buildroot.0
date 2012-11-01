From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:35:44 +0100
Subject: [Buildroot] [PATCH 3 2/9] flex: only needs gettext if locale is
	selected
In-Reply-To: <20121101143539.8550.70150.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
Message-ID: <20121101143544.8550.20909.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/flex/Config.in |    1 +
 package/flex/flex.mk   |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index b10eb00..8ce4ccd 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLEX
 	bool "flex"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A fast lexical analyser generator.  A tool for generating
 	  programs that perform pattern-matching on text.
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 2599cdc..fe21432 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -11,8 +11,7 @@ FLEX_PATCH = flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_INSTALL_STAGING = YES
-FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+FLEX_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES =
 
