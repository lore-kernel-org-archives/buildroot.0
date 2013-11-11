From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 12:53:11 +0100
Subject: [Buildroot] [PATCH 1 of 2] dhrystone: remove usage of FOO_DIR_PREFIX
In-Reply-To: <patchbomb.1384170790@argentina>
References: <patchbomb.1384170790@argentina>
Message-ID: <2178aae52ad9825f6186.1384170791@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the semantics of FOO_DIR_PREFIX will change in the following patch, we
want to remove unnecessary usage of this variable.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/dhrystone/dhrystone.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -10,7 +10,7 @@ DHRYSTONE_SITE = http://www.netlib.org/b
 
 define DHRYSTONE_EXTRACT_CMDS
 	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
-	$(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
+	$(Q)cp package/dhrystone/Makefile $(@D)/
 endef
 
 define DHRYSTONE_BUILD_CMDS
