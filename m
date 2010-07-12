From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 12 Jul 2010 23:30:48 +0200
Subject: [Buildroot] [PATCH 1/5] packages: pass the package name to the
	DOWNLOAD macro
In-Reply-To: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1278970252-23007-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables DOWNLOAD to have a more complex behaviour than it currently can.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Makefile.package.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index c476de9..8243ed5 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -76,6 +76,7 @@ TERM_RESET := $(shell tput rmso)
 #
 # Argument 1 is the source location
 # Argument 2 is the source filename
+# Argument 3 is the uppercase package name
 #
 # E.G. use like this:
 # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
@@ -124,7 +125,7 @@ ifeq ($(SPIDER),)
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
+	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE),$(PKG))
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
 ifeq ($(SPIDER),)
 	$(Q)mkdir -p $(@D)
-- 
1.7.0.4
