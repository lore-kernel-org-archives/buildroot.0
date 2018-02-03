From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  3 Feb 2018 16:09:24 +0100
Subject: [Buildroot] [PATCH] package/bash: remove dead comment
Message-ID: <20180203150924.3251-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 02e5cef1 (system: add option to choose what /bin/sh points to)
removed the symlink creation, but forgot to remove the corresponding
comment, which is now more puzzling than amusing...

Remove the comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Noticed while reviewing the series adding shells to /etc/shells.
Thanks Romain! ;-)
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
-- 
2.14.1
