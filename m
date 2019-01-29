From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 29 Jan 2019 13:36:08 +0100
Subject: [Buildroot] [PATCH] package/busybox: drop empty configure command
Message-ID: <31287_1548765380_5C5048C4_31287_396_1_f8e0aabc-6c1f-4878-b75e-c8bbc4e1a17e@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 50dc350c65 (package/busybox: update to 1.29.0), we no
longer define the BUSYBOX_NOCLOBBER_INSTALL macro, so it expands to an
empty string, so we end up with no action in BUSYBOX_CONFIGURE_CMDS.

Drop BUSYBOX_CONFIGURE_CMDS now that it serves no purpose.

Signed-off-by: Yann MORIN <yann.morin@orange.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Carlos Santos <casantos@datacom.com.br>
---
 package/busybox/busybox.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bfcca6ed3e..5c5a8ea839 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -323,10 +323,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 endef
 
-define BUSYBOX_CONFIGURE_CMDS
-	$(BUSYBOX_NOCLOBBER_INSTALL)
-endef
-
 define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D)
 endef
-- 
2.17.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
