From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:53:53 +0200
Subject: [Buildroot] [PATCH 02/28] Fix quoting in default extract command
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0c3601a44b9247f8f2e888dbb8c061c0171f968b.1309895466.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
1.7.4.1
