From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 22:21:54 +0200
Subject: [Buildroot] [PATCH 02/21] Fix quoting in default extract command
In-Reply-To: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
Message-ID: <139ec39a7fc192b04143da224d8759c36e35bf33.1305577083.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 9949b58..0a4c220 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -425,7 +425,8 @@ $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
-$(2)_EXTRACT_CMDS ?= $(if $($(2)_SOURCE),$(INFLATE$(suffix $($(2)_SOURCE))) $(DL_DIR)/$($(2)_SOURCE) | \
+$(2)_EXTRACT_CMDS ?= \
+	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
 
 # post-steps hooks
-- 
1.7.1
