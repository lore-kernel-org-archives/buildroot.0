From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Dec 2010 09:14:15 +0100
Subject: [Buildroot] [git commit master 1/1] automake: ensure staging
	aclocal dir gets created
Message-ID: <20101229081558.B70F28EB6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=38826858c03db1ac09723ef5948eba438a349e09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise aclocal fails.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/automake/automake.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 964f2fb..8857e98 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -15,7 +15,13 @@ define GTK_DOC_M4_INSTALL
  $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
 endef
 
+# ensure staging aclocal dir exists
+define HOST_AUTOMAKE_MAKE_ACLOCAL
+	mkdir -p $(ACLOCAL_DIR)
+endef
+
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
+HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
 $(eval $(call AUTOTARGETS,package,automake))
 $(eval $(call AUTOTARGETS,package,automake,host))
-- 
1.7.2.2
