From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:14 +0200
Subject: [Buildroot] [PATCH 28/74] openssh: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2a784080ad8efcdff981bca54574c3b7a09c532b.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssh/openssh.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 64274e5..17044cc 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -14,8 +14,10 @@ OPENSSH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
-$(eval $(call AUTOTARGETS,package,openssh))
-
-$(OPENSSH_HOOK_POST_INSTALL):
+define OPENSSH_INSTALL_INITSCRIPT
 	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
-	touch $@
+endef
+
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
+
+$(eval $(call AUTOTARGETS,package,openssh))
-- 
1.7.0.4
