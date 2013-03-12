From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 11 Mar 2013 21:58:31 -0400
Subject: [Buildroot] [PATCH] pkg-autotools.mk: remove extra space from
	config-update message
Message-ID: <1363053511-9208-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you do a "make -s", you will notice that the UPDATE_CONFIG_HOOK message
has an extra space compared to other highlighted messages. ?For example:

>>> util-linux 2.20.1 ?Updating config.sub and config.guess
>>> util-linux 2.20.1 Patching libtool
>>> util-linux 2.20.1 Autoreconfiguring

A grep shows this is the only instance of the extra space. This patch
removes the extra space.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/pkg-autotools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 890506b..995c685 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -145,7 +145,7 @@ endif
 # Hook to update config.sub and config.guess if needed
 #
 define UPDATE_CONFIG_HOOK
-       @$$(call MESSAGE, "Updating config.sub and config.guess")
+       @$$(call MESSAGE,"Updating config.sub and config.guess")
        $$(call CONFIG_UPDATE,$$(@D))
 endef
 
-- 
1.7.9.5
