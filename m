From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:09:51 +0200
Subject: [Buildroot] [PATCH 8/8] Revert "Makefile.package.in: allow packages
	to override download step"
In-Reply-To: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1283422191-30926-9-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 48cf66f1a2e2c501abeee98b7a2268b0d6d2010d.
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 6f584a7..58b417b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -402,7 +402,7 @@ $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE ?=		$$($(2)_DIR)/.stamp_downloaded
+$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
-- 
1.6.3.3.346.g8a41d
