From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Dec 2010 20:35:40 +0100
Subject: [Buildroot] [git commit master 1/1] automake: install gtk-doc.m4 in
	host directory instead of staging
Message-ID: <20101228193703.164048EB88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b0e9dd06f27d134340a4aedde6e6e2105820832
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/automake/automake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 6ee3121..964f2fb 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -12,7 +12,7 @@ AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
 define GTK_DOC_M4_INSTALL
- $(INSTALL) -m 0644 package/automake/gtk-doc.m4 $(STAGING_DIR)/usr/share/aclocal/
+ $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
 endef
 
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
-- 
1.7.2.2
