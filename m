From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:36:57 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] zsh: disable NIS support
Message-ID: <20171017090326.0049981190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00f9c8df7bf58d312b0dcfcdbf5b2622d86f9038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

The configure test for NIS and NIS+ looks for the ypcat and nisls host
utilities, respectively. This is not compatible with cross compilation.
Disable both unconditionally.

Fixes:
http://autobuild.buildroot.net/results/54c/54c9c5dff3df0a43573b03896cb0629fcae08478/
http://autobuild.buildroot.net/results/c8e/c8e30a1eb6e77ae76292b6a01bede5abb2b1b7b7/

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4a4f99a428f3c49aa80440325db33485777e8f69)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 779114e..72de2c6 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -9,6 +9,7 @@ ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
+ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 
