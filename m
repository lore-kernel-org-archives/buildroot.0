From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 25 Jul 2016 15:35:18 -0300
Subject: [Buildroot] [PATCH] docs/manual: use TARGET_CONFIGURE_OPTS in
	generic-package tutorial
Message-ID: <1469471718-26700-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TARGET_CONFIGURE_OPTS is preferred over manually using CC and LD.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index f18465b85107..ef895ec91717 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -29,7 +29,7 @@ system is based on hand-written Makefiles or shell scripts.
 14: LIBFOO_DEPENDENCIES = host-libaaa libbbb
 15:
 16: define LIBFOO_BUILD_CMDS
-17:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+17:	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
 18: endef
 19:
 20: define LIBFOO_INSTALL_STAGING_CMDS
-- 
1.9.1
