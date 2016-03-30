From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 14:31:28 +0100
Subject: [Buildroot] [PATCH] tcl: remove non-existent --with-system-sqlite
	configure option
Message-ID: <1459344688-24416-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, even if this option is not available anymore, it's
causing build failures if we use it. When we remove it the build
succeeds.

Fixes:
  http://autobuild.buildroot.net/results/022/02296f8624d3406a63d3a179f53862f245c56dc1/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 9fd1195..52be7b8 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -21,8 +21,7 @@ TCL_AUTORECONF = YES
 TCL_CONF_OPTS = \
 	--disable-symbols \
 	--disable-langinfo \
-	--disable-framework \
-	--with-system-sqlite
+	--disable-framework
 
 HOST_TCL_CONF_OPTS = \
 	--disable-symbols \
-- 
2.7.3
