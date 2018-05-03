From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:15:07 +0200
Subject: [Buildroot] [git commit] package/bash: add missing double-dollar
 for /etc/shells
Message-ID: <20180503212454.E641D8B602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=849d748ae61badfbead9630454a6c1c93ee81bb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4d279697afbf8fb295274784103be2b837113d5e missed one comment
from Yann E. Morin about the double-dollar.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bash/bash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index b162d93188..2182bede15 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -45,7 +45,7 @@ define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
 	rm -f $(TARGET_DIR)/bin/bashbug
-	grep -qsE '^/bin/bash' $(TARGET_DIR)/etc/shells \
+	grep -qsE '^/bin/bash$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
 endef
 
