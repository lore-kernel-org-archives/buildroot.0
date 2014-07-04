From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  4 Jul 2014 17:56:26 +0200
Subject: [Buildroot] [PATCH 3/3] exim: generate the user with automatic uid
In-Reply-To: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1404489386-7523-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the exim username is configurable it is more likely that
other packages generate a conflicting user. Switch to automatic uid
generation to avoid any problem.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 163861b..18745ac 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -93,7 +93,7 @@ define EXIM_INSTALL_TARGET_CMDS
 endef
 
 define EXIM_USERS
-$(call qstrip,$(BR2_PACKAGE_EXIM_USER)) 88 mail 8 * - - - exim
+$(call qstrip,$(BR2_PACKAGE_EXIM_USER)) -1 mail 8 * - - - exim
 endef
 
 define EXIM_INSTALL_INIT_SYSV
-- 
1.9.1
