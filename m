From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:24:09 +0200
Subject: [Buildroot] [PATCH 4/8] package: added PKG_CONF_ENV variables to
	host packages
In-Reply-To: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
References: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272587053-19535-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.autotools.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 38e57cd..b7a7103 100644
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
1.7.0.4
