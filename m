From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Jan 2018 18:44:18 +0100
Subject: [Buildroot] [PATCH v2 8/8] package/bash: add missing double-dollar
 for /etc/shells
In-Reply-To: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
References: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516211058-466-9-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4d279697afbf8fb295274784103be2b837113d5e missed one comment
from Yann E. Morin about the double-dollar.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/bash/bash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 03f8f28..ab6b43b 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -46,7 +46,7 @@ define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
 	rm -f $(TARGET_DIR)/bin/bashbug
-	grep -qsE '^/bin/bash' $(TARGET_DIR)/etc/shells \
+	grep -qsE '^/bin/bash$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
 endef
 
-- 
2.7.4
