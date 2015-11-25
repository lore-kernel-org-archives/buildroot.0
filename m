From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:47:01 +0100
Subject: [Buildroot] [git commit] package/autossh: do not look for the
	host's ssh command
Message-ID: <20151125214948.0139D801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=870e13d916bab55e0e517853463aef520f361472
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autossh looks for 'ssh' in the PATH, which may not exist on a build
machine.

Fixes a private autobuild failure (soon to go public).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autossh/autossh.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
