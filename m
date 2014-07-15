From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:18:25 +0200
Subject: [Buildroot] [git commit] pkg-utils: kconfig helpers: add basic
	usage documentation
Message-ID: <20140715171925.B03109D20C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=358bf954452c095e5f782187ad7579e42d903df3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 59a5ab2..e802864 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -33,17 +33,17 @@ $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM
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
