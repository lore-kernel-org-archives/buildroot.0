From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 21:54:42 +0100
Subject: [Buildroot] [git commit] vim: Docs are only available when
	BR2_PACKAGE_VIM_RUNTIME is selected
Message-ID: <20130219205501.E1B0B9AB69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=033928fd01456f599ee86a95d1a1894246ac90ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/adc3e2f876f83a4011574e03bceb0007d7e891a2/build-end.log

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
