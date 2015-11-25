From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Nov 2015 22:44:58 +0100
Subject: [Buildroot] [PATCH] package/autossh: do not look for the host's ssh
	command
Message-ID: <1448487898-25214-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autossh looks for 'ssh' in the PATH, which may not exist on a build
machine.

Fixes a private autobuild failure (soon to go public).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/autossh/autossh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 01d3c65..8a9def3 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -10,6 +10,8 @@ AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
 
+AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
+
 define AUTOSSH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/autossh $(TARGET_DIR)/usr/bin/autossh
 endef
-- 
1.9.1
