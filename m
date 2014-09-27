From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Sep 2014 18:39:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/readline: add host variant
Message-ID: <1411835956-23735-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by SoftEther VPN.

host-readline will also be needed by host-pcre, which in turn will
be needed by the yet-to-be-released leafnode2 package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/readline/readline.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index d670a71..c004899 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -8,6 +8,7 @@ READLINE_VERSION = 6.3
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses
+HOST_READLINE_DEPENDENCIES = host-ncurses
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 	bash_cv_wcwidth_broken=no
 READLINE_LICENSE = GPLv3+
@@ -20,3 +21,4 @@ endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
