From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Jan 2011 21:53:34 +0100
Subject: [Buildroot] [git commit master 1/1] vim: ensure configure doesn't
	fail if X11 packages are enabled
Message-ID: <20110101205456.B1F158072D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=358214a8ba3e36f465829a33de7ea5c5ad0cef38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When X11 is detected, vim's configure does a AC_TRY_RUN to detect wchar_t
size, so preset it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vim/vim.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index e94bb1e..917d1d4 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -17,7 +17,9 @@ VIM_CONF_ENV = vim_cv_toupper_broken=no \
 		vim_cv_getcwd_broken=no \
 		vim_cv_stat_ignores_slash=yes \
 		vim_cv_memmove_handles_overlap=yes \
-		ac_cv_sizeof_int=4
+		ac_cv_sizeof_int=4 \
+		ac_cv_small_wchar_t=no
+
 VIM_CONF_OPT = --with-tlib=ncurses
 
 define VIM_INSTALL_TARGET_CMDS
-- 
1.7.2.2
