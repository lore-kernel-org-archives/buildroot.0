From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 21:51:40 +0200
Subject: [Buildroot] [git commit] core: simplify removal of generated
 br2-external files
Message-ID: <20190803194903.A9F51801B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76345bf6bcd3429f44156dc3654144403f485051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all the br2-external generated files are named after the same
pattern, it gets easier to remove them all using a glob.

Furthermore, we're on the verge of introducing more such generated
files, so removing them at one fell swoop will be simpler too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8bca4bafd0..24cb6be85e 100644
--- a/Makefile
+++ b/Makefile
@@ -1066,7 +1066,7 @@ ifeq ($(O),$(CURDIR)/output)
 	rm -rf $(O)
 endif
 	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
-		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE) $(BASE_DIR)/.br2-external.in
+		$(CONFIG_DIR)/.auto.deps $(BASE_DIR)/.br2-external.*
 
 .PHONY: help
 help:
