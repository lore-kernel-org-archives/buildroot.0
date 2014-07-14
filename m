From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Jul 2014 13:50:25 +0200
Subject: [Buildroot] [PATCH 1 of 6] pkg-utils: kconfig helpers: add basic
 usage documentation
In-Reply-To: <patchbomb.1405338624@localhost>
References: <patchbomb.1405338624@localhost>
Message-ID: <4a53bf323d8a1808dd1b.1405338625@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-utils.mk |  6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff -r 7c17407eb26e -r 4a53bf323d8a package/pkg-utils.mk
--- a/package/pkg-utils.mk	Sat Jul 12 14:41:41 2014 -0300
+++ b/package/pkg-utils.mk	Wed Jul 09 20:27:38 2014 +0200
@@ -33,17 +33,17 @@
 # package, and more.
 #
 
-define KCONFIG_ENABLE_OPT
+define KCONFIG_ENABLE_OPT # (option, file)
 	$(SED) "/\\<$(1)\\>/d" $(2)
 	echo "$(1)=y" >> $(2)
 endef
 
-define KCONFIG_SET_OPT
+define KCONFIG_SET_OPT # (option, value, file)
 	$(SED) "/\\<$(1)\\>/d" $(3)
 	echo "$(1)=$(2)" >> $(3)
 endef
 
-define KCONFIG_DISABLE_OPT
+define KCONFIG_DISABLE_OPT # (option, file)
 	$(SED) "/\\<$(1)\\>/d" $(2)
 	echo "# $(1) is not set" >> $(2)
 endef
