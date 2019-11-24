From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Nov 2019 00:10:02 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic: fix reconfigure for
 kconfig packages
Message-ID: <20191124231002.32255-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kconfig based packages are not really reconfigured if the .config file is not
regenerated in the reconfigure target.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7d6fa08418..d7a678412e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -693,6 +693,7 @@ $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_DIR)/.stamp_actual_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+$(2)_TARGET_DOTCONFIG =		$$($(2)_DIR)/.stamp_dotconfig
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
@@ -904,6 +905,7 @@ $(1)-rebuild:		$(1)-clean-for-rebuild $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
+			rm -f $$($(2)_TARGET_DOTCONFIG)
 
 $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
-- 
2.17.1
