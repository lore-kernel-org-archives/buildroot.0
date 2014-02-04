From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 14:02:47 +0100
Subject: [Buildroot] [git commit] dhrystone: remove usage of FOO_DIR_PREFIX
Message-ID: <20140204130643.41DBA9C7C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58c350ba678cad13c56372a886f56f1d83e5bfc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the semantics of FOO_DIR_PREFIX will change in the following patch, we
want to remove unnecessary usage of this variable.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhrystone/dhrystone.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index d49620c..856dff1 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -10,7 +10,7 @@ DHRYSTONE_SITE = http://www.netlib.org/benchmark/
 
 define DHRYSTONE_EXTRACT_CMDS
 	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
-	$(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
+	$(Q)cp package/dhrystone/Makefile $(@D)/
 endef
 
 define DHRYSTONE_BUILD_CMDS
