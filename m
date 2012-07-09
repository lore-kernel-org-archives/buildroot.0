From: Philippe Reynes <philippe.reynes@sagemcom.com>
Date: Mon, 9 Jul 2012 09:20:07 +0200
Subject: [Buildroot] [PATCH] Allow to run severals post build scripts
	instead of only one
Message-ID: <12576_1341818407_4FFA8627_12576_5085_3_1341818407-21478-1-git-send-email-philippe.reynes@sagemcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using severals post build scripts is usefull to share
script between severals boards/projects.

Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b80477f..56833da 100644
--- a/Makefile
+++ b/Makefile
@@ -449,7 +449,8 @@ endif
 
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 	@$(call MESSAGE,"Executing post-build script")
-	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
+	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		$(s) $(TARGET_DIR);)
 endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
-- 
1.7.1


#
" Ce courriel et les documents qui lui sont joints peuvent contenir des
informations confidentielles ou ayant un caract?re priv?. S'ils ne vous sont
pas destin?s, nous vous signalons qu'il est strictement interdit de les
divulguer, de les reproduire ou d'en utiliser de quelque mani?re que ce
soit le contenu. Si ce message vous a ?t? transmis par erreur, merci d'en
informer l'exp?diteur et de supprimer imm?diatement de votre syst?me
informatique ce courriel ainsi que tous les documents qui y sont attach?s."


                               ******

" This e-mail and any attached documents may contain confidential or
proprietary information. If you are not the intended recipient, you are
notified that any dissemination, copying of this e-mail and any attachments
thereto or use of their contents by any means whatsoever is strictly
prohibited. If you have received this e-mail in error, please advise the
sender immediately and delete this e-mail and all attached documents
from your computer system."
#
