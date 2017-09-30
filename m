From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 08:53:10 +0200
Subject: [Buildroot] [git commit] zsh: bump to version 5.4.2
Message-ID: <20170930065311.67E6581039@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f890e343a8a8742dd5525e90fa11b4475eca9766
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not provide a .tar.xz archive for this release. Revert to
.tar.gz.

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.hash | 5 +++--
 package/zsh/zsh.mk   | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 9c6acf3..3155a5f 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,4 +1,5 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	67d3e5ed99de68340c16aef613b0ecf7	zsh-5.3.1.tar.xz
+md5	dfe156fd69b0d8d1745ecf6d6e02e047	zsh-5.4.2.tar.gz
 # Calculated based on the hash above and after checking signature
-sha256	fc886cb2ade032d006da8322c09a7e92b2309177811428b121192d44832920da	zsh-5.3.1.tar.xz
+# http://www.zsh.org/pub/zsh-5.4.2.tar.gz.asc
+sha256	957bcdb2c57f64c02f673693ea5a7518ef24b6557aeb3a4ce222cefa6d74acc9	zsh-5.4.2.tar.gz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 72de2c6..bfd0a1a 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.3.1
+ZSH_VERSION = 5.4.2
 ZSH_SITE = http://www.zsh.org/pub
-ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
 ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
