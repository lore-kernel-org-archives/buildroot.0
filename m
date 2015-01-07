From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jan 2015 15:50:24 +0100
Subject: [Buildroot] [git commit] vim: also install xxd
Message-ID: <20150107145828.2137D807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c47b1fde62e6e24c8689867c0047debfbe1d62a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quite a number of scripts use xxd, so install it as well.

Install it unconditionally as the size is trivial compared to vim (~10kb vs
~1.5MB).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 01ba27e..da84d14 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -31,6 +31,7 @@ VIM_LICENSE_FILES = README.txt
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
 		$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
 		$(MAKE) DESTDIR=$(TARGET_DIR) installlinks
 endef
 
