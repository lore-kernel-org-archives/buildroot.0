From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 19:55:51 +0100
Subject: [Buildroot] [git commit] package/bash: remove dead comment
Message-ID: <20180203190214.660C7882B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eadf8696a899cea391d7abe7f0547152c64ed40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 02e5cef1 (system: add option to choose what /bin/sh points to)
removed the symlink creation, but forgot to remove the corresponding
comment, which is now more puzzling than amusing...

Remove the comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 03f8f286ed..e9384911a0 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -39,7 +39,6 @@ BASH_CONF_ENV += bash_cv_getenv_redef=yes
 endif
 endif
 
-# Make /bin/sh -> bash (no other shell, better than busybox shells)
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
 # can reject the user connexion. See man shells.
 define BASH_INSTALL_TARGET_CMDS
