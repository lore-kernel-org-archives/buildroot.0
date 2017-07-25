From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 26 Jul 2017 00:57:51 +0200
Subject: [Buildroot] [git commit] package/skeleton: remove legacy mkdir
Message-ID: <20170726001840.837A080ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd8298a713bf31ae39316f08f78300d8222e3065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We've had this mkdir, in various forms, for aeons. It dates back to
the inception of Buildroot, at the dawn of ages, when the toolchain
support was still nascent. Evolution had it morph from /include, to
a tuple-prefixed directory and a symlink there-to, then back to the
/include directory, to the final /usr/include directory we've had
for the last 9 years.

Anything that wants to install headers is supposed to be creating
that directory beforehand; we don't need this legacy mkdir now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton/skeleton.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4a66f6c..f5106f7 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -82,7 +82,6 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
 endef
