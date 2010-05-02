From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] package: Force copy of .la files at
	the post install hook (readonly files might be problematic)
Message-ID: <20100502074443.E765F8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e8b469b81fe06cbc01f2c00dfe11a2193c612327
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 34aab77..b7a7103 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -201,7 +201,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
-		cp $$$$i $$$$i~; \
+		cp -f $$$$i $$$$i~; \
 		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
 	done
 endef
-- 
1.6.3.3
