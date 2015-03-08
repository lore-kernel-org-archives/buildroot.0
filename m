From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 15:32:34 +0100
Subject: [Buildroot] [git commit] package/readline: add host variant
Message-ID: <20150308145356.D425E8080B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=063ff25f6aeb626da03c49d5216bdd3c6b4f0482
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by SoftEther VPN.

host-readline will also be needed by host-pcre, which in turn will
be needed by the yet-to-be-released leafnode2 package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/readline/readline.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
