From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Oct 2015 17:28:59 +0000
Subject: [Buildroot] [PATCH] zsh: bump to version 5.1.1
In-Reply-To: <1443804447-17983-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443804447-17983-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <38121FAB319C3344930C920E7B5183136A3DBE47@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/bin/zsh 
output/target/bin/zsh: ELF 32-bit MSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 2.6.32, stripped

$ grep ^ZSH_VERSION package/zsh/zsh.mk 
ZSH_VERSION = 5.1.1

Regards,

Vincent.

________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Gustavo Zacarias [gustavo at zacarias.com.ar]
Sent: 02 October 2015 17:47
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH] zsh: bump to version 5.1.1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zsh/zsh.hash | 4 +++-
 package/zsh/zsh.mk   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 358033f..57c34be 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,2 +1,4 @@
 # From http://www.zsh.org/pub/MD5SUM
-md5    76726ff50309e628de670476e0508b3a        zsh-5.0.7.tar.gz
+md5    0e8ea3313300277a04cee80836507bae        zsh-5.1.1.tar.xz
+# Calculated based on the hash above
+sha256 74e9453b5470b3c0970f9f93cfd603d241c3d7b1968adc0e4b3951073e8d3dec        zsh-5.1.1.tar.xz
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index ffc567d..212305b 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################

-ZSH_VERSION = 5.0.7
+ZSH_VERSION = 5.1.1
 ZSH_SITE = http://www.zsh.org/pub
+ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
 ZSH_LICENSE = MIT-like
--
2.4.9

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
