From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 15 Mar 2009 12:39:23 +0100
Subject: [Buildroot] [PATCH] vim: fix download of patches
In-Reply-To: <20090309194755.9831D764AC@busybox.osuosl.org>
References: <20090309194755.9831D764AC@busybox.osuosl.org>
Message-ID: <200903151239.24015.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following error:
No rule to make target '$(DL_DIR)/7.1.001', needed by 'vim-source'

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---

jacmet at uclibc.org, 09.03.2009:
> Author: jacmet
> Date: 2009-03-09 19:47:55 +0000 (Mon, 09 Mar 2009)
> New Revision: 25592
> 
> Log:
> vim: fixup patch download location after change to DOWNLOAD macro.

Didn't work after this commit if the vim patches weren't yet available
as dl/7.1.*, but still in dl/vim/7.1.*


 package/editors/vim/vim.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/editors/vim/vim.mk b/package/editors/vim/vim.mk
index 79d892b..9d42354 100644
--- a/package/editors/vim/vim.mk
+++ b/package/editors/vim/vim.mk
@@ -16,7 +16,7 @@ VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk
 $(DL_DIR)/$(VIM_SOURCE):
 	$(call DOWNLOAD,$(VIM_SOURCE_SITE),$(VIM_SOURCE))
 
-$(DL_DIR)/vim/%:
+$(DL_DIR)/%:
 	$(call DOWNLOAD,$(VIM_PATCH_SITE),$*)
 
 vim-source: $(DL_DIR)/$(VIM_SOURCE) $(VIM_PATCHES)
-- 
1.6.2.106.gc2bb8
