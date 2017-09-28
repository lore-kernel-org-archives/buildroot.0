From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Sep 2017 23:43:52 +0300
Subject: [Buildroot] [PATCH 1/2] zsh: disable NIS support
Message-ID: <33b2c8f26ae3bc1de8e83512a9074beddc9cc764.1506631433.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure test for NIS and NIS+ looks for the ypcat and nisls host
utilities, respectively. This is not compatible with cross compile.
Disable both unconditionally.

Fixes:
http://autobuild.buildroot.net/results/54c/54c9c5dff3df0a43573b03896cb0629fcae08478/
http://autobuild.buildroot.net/results/c8e/c8e30a1eb6e77ae76292b6a01bede5abb2b1b7b7/

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zsh/zsh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 779114e5ea38..72de2c6b3ad9 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -9,6 +9,7 @@ ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
+ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 
-- 
2.14.2
