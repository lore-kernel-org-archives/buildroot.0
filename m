From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 01:50:35 +0200
Subject: [Buildroot] [git commit] package/nss-mdns: move hook from
 post-install to finalize
Message-ID: <20181020234904.DDE2288085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6433cefa5c22e879fa2df0d3501a7492c4b9019c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both nss-mdns and nss-myhostname patch nsswitch.conf file so it needs to be
done at the final stage to support per-package host/target directories.

[Peter: reword]
Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/nss-mdns.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 407b9426b2..ee666c76a0 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -17,6 +17,6 @@ define NSS_MDNS_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
+NSS_MDNS_TARGET_FINALIZE_HOOKS += NSS_MDNS_INSTALL_CONFIG
 
 $(eval $(autotools-package))
