From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jul 2017 13:20:43 +0200
Subject: [Buildroot] [PATCH] legal-info: add hash for our own license file
Message-ID: <20170705112043.22913-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This silences the annoying warning that there is no hash file for our
own COPYING file.

Also change the message so that it is more obvious what we're doing.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>

---
Note: the message is not properly aligned with the others, because
saving our own license file is not part of a package action.
---
 Makefile                          | 4 ++--
 support/legal-info/buildroot.hash | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 support/legal-info/buildroot.hash

diff --git a/Makefile b/Makefile
index 19d8b442a3..1c243b9c80 100644
--- a/Makefile
+++ b/Makefile
@@ -744,8 +744,8 @@ legal-info-clean:
 
 .PHONY: legal-info-prepare
 legal-info-prepare: $(LEGAL_INFO_DIR)
-	@$(call MESSAGE,"Collecting legal info")
-	@$(call legal-license-file,buildroot,buildroot,.,COPYING,COPYING,HOST)
+	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
+	@$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
diff --git a/support/legal-info/buildroot.hash b/support/legal-info/buildroot.hash
new file mode 100644
index 0000000000..1b62dbeef7
--- /dev/null
+++ b/support/legal-info/buildroot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
-- 
2.11.0
