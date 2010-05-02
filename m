From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] package: add PKG_CONF_ENV variables
	to host packages
Message-ID: <20100502074443.B9AA88A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1b41e32febf8561dcff18d90e2be8c921b824f71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index a4be8c8..34aab77 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -108,6 +108,7 @@ define $(2)_CONFIGURE_CMDS
 	        $$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
+                $$($$(PKG)_CONF_ENV) \
 		./configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
-- 
1.6.3.3
