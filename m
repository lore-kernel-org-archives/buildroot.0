From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 08:49:38 +0200
Subject: [Buildroot] [git commit] connman: ensure connmanctl is only built
	if explicitly enabled
Message-ID: <20121004065114.9A98A997AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96d677bc3a2a6561c3e7efe062e5f6dab360d78a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3d3a2eec6a2520f048e00eeb967e3a770ffbcdd3

connmanctl is now built by default unless explicitly disabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/connman.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 7a52071..2ce3dbd 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -32,6 +32,8 @@ define CONNMAN_INSTALL_CM
 endef
 
 CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
+else
+CONNMAN_CONF_OPT += --disable-client
 endif
 
 $(eval $(autotools-package))
