From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:20:25 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/fwts: add
 optional bash-completion dependency
Message-ID: <20190124162018.7C8638E4AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63149e45eb90766e30ed9088642116f84a39d892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

fwts uses the completionsdir variable from bash-completion.pc to decide
where to install things.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7da56120a029cff7bba212fe74b4f59ae830ed70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/fwts.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index aa006f3b8b..b29de2cf25 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -11,6 +11,7 @@ FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
+	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
 ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
