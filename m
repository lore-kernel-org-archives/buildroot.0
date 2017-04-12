From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:17 +0200
Subject: [Buildroot] [PATCH 43/53] opkg-utils: use $(HOST_DIR) as PREFIX
	instead of DESTDIR
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-44-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and remove the /usr prefix

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opkg-utils/opkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 6f4e64e34f..df202220d2 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -15,7 +15,7 @@ define HOST_OPKG_UTILS_BUILD_CMDS
 endef
 
 define HOST_OPKG_UTILS_INSTALL_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/usr install
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
-- 
2.11.0
