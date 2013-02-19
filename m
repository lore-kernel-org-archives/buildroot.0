From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 19 Feb 2013 16:30:46 +0000
Subject: [Buildroot] [PATCH buildroot] vim: Docs are only available when
	BR2_PACKAGE_VIM_RUNTIME is selected
Message-ID: <1361291446-7393-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Fixes
http://autobuild.buildroot.net/results/adc3e2f876f83a4011574e03bceb0007d7e891a2/build-end.log

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/vim/vim.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4e273d4..cb08cd9 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -42,10 +42,9 @@ endef
 
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
-endif
-
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
 endif
+endif
 
 $(eval $(autotools-package))
-- 
1.7.1
