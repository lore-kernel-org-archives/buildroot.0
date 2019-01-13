From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jan 2019 18:58:21 +0100
Subject: [Buildroot] [PATCH 1/1] fwts: add optional bash-completion
 dependency
Message-ID: <20190113175821.30652-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fwts uses the completionsdir variable from bash-completion.pc to decide
where to install things.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
