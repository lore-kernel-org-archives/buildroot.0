From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 14:53:32 +0200
Subject: [Buildroot] [git commit] zsh: bump to version 5.5
Message-ID: <20180410125347.A80A988379@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02fe101688132e0dd8d3ad6bc152db066880653f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now have tar.xz archive again, use that.

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zsh/zsh.hash | 6 +++---
 package/zsh/zsh.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 0770d8e247..5931e4d465 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,7 +1,7 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5	dfe156fd69b0d8d1745ecf6d6e02e047	zsh-5.4.2.tar.gz
+md5	5c3b294e63b6cc8da8bcc364c72d954b	zsh-5.5.tar.xz
 # Calculated based on the hash above and after checking signature
-# http://www.zsh.org/pub/zsh-5.4.2.tar.gz.asc
-sha256	957bcdb2c57f64c02f673693ea5a7518ef24b6557aeb3a4ce222cefa6d74acc9	zsh-5.4.2.tar.gz
+# http://www.zsh.org/pub/zsh-5.5.tar.xz.asc
+sha256	a8359b81d090425d497c6f3c724a7c21a81c614b03e7662ed347705d86958e53	zsh-5.5.tar.xz
 # Locally calculated
 sha256	d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index bfd0a1a30f..a45c61b931 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.4.2
+ZSH_VERSION = 5.5
 ZSH_SITE = http://www.zsh.org/pub
+ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
 ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
