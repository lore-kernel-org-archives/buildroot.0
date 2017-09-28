From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Sep 2017 23:43:53 +0300
Subject: [Buildroot] [PATCH 2/2] zsh: bump to version 5.4.2
In-Reply-To: <33b2c8f26ae3bc1de8e83512a9074beddc9cc764.1506631433.git.baruch@tkos.co.il>
References: <33b2c8f26ae3bc1de8e83512a9074beddc9cc764.1506631433.git.baruch@tkos.co.il>
Message-ID: <9493704a4250d204236f37eebc1b07162ed0f80a.1506631433.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not provide a .tar.xz archive for this release. Revert to
.tar.gz.

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zsh/zsh.hash | 5 +++--
 package/zsh/zsh.mk   | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 9c6acf336ff3..3155a5f74d40 100644
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
index 72de2c6b3ad9..bfd0a1a30ff2 100644
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
-- 
2.14.2
