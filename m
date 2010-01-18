From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 15:14:18 +0100
Subject: [Buildroot] [git commit master] Makefile.autotools.in: fixup .la
	files in all lib dirs
Message-ID: <20100118141647.D52B477708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ecf5939cfb394289cb275134e2929b5d9076628d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes usr/lib32 or usr/lib64 is used instead of usr/lib, so search
those for .la files as well.

Fixes .la fixup for beecrypt on x86-64.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index f0f189f..7114bba 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -201,7 +201,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	for i in $$$$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
+	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp $$$$i $$$$i~; \
 		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
 	done
-- 
1.6.3.3
