From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 16:31:40 +0200
Subject: [Buildroot] [git commit] legal-info: add hash for our own license
	file
Message-ID: <20170705142853.4BB9F80AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=719726af2e95a62432013a6238954bebdc2d3dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This silences the annoying warning that there is no hash file for our
own COPYING file.

Also change the message so that it is more obvious what we're doing.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                          | 4 ++--
 support/legal-info/buildroot.hash | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0827c4e..a22e87f 100644
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
index 0000000..1b62dbe
--- /dev/null
+++ b/support/legal-info/buildroot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
