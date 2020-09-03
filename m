From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:48:27 +0200
Subject: [Buildroot] [git commit] package/iputils: use relative symlink for
 ping6
Message-ID: <20200903194110.1759C83937@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4b5655689a91bb096c5b2f04b74252b6e86243d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was initially commit 84d471a0b150bc2ff1d08755d36be86d9380c2c5,
but it got mistakenly reverted by
95b0078cc089b48be8973b9507599cc836397869, so let's restore it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index e10c0636c9..4f8d9cb768 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -61,7 +61,7 @@ endif
 
 # upstream requires distros to create symlink
 define IPUTILS_CREATE_PING6_SYMLINK
-	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
+	ln -sf ping $(TARGET_DIR)/bin/ping6
 endef
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
 
