From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:39:09 +0100
Subject: [Buildroot] [git commit] package/patch: annote CVE-2018-6951
Message-ID: <20200303212705.93E3E8F289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8105f4f597a61d76b0658e539715354c5d042104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/patch/patch.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index d581682c70..ca54beab6d 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -10,6 +10,9 @@ PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPL-3.0+
 PATCH_LICENSE_FILES = COPYING
 
+# 0001-Fix-segfault-with-mangled-rename-patch.patch
+PATCH_IGNORE_CVES += CVE-2018-6951
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
