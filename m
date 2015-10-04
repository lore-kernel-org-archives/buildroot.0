From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 11:25:32 +0100
Subject: [Buildroot] [git commit] vim: bump to version 7.4.889
Message-ID: <20151004102537.6D23C81648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d8a254dd76de970776ab63fd65bfee75f44b13c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also move to GitHub since Google Code is going to die soon.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vim/vim.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 518afaf..a6b75d0 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-VIM_SITE = https://vim.googlecode.com/hg
-VIM_SITE_METHOD = hg
-# 7.4 release patchlevel 333
-VIM_VERSION = 8ae50e3ef8bf
+# 7.4 release patchlevel 889
+VIM_VERSION = 74b738d414b2895b3365e26ae3b7792eb82ccf47
+VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
 # Win over busybox vi since vim is more feature-rich
 VIM_DEPENDENCIES = \
 	ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
