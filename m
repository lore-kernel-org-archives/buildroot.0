From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:15:20 +0100
Subject: [Buildroot] [git commit] jasper: disable PDF documentation
	generation
Message-ID: <20170116124620.B4588817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a0402d3a8ab9b25cdc4bed5ab50db127e502dfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need the PDF document on target. This also avoids incompatible host
Latex packages.

Fixes:
http://autobuild.buildroot.net/results/e60/e60c4a71a08aebadd0bc3fb95a57a4a223e4b6fa/
http://autobuild.buildroot.net/results/4ec/4ec8a1735590a3cad4b74630b4b6bdd2e3a7eec8/

[Peter: reformat as suggested by Yann]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index f4db8c4..a243b9a 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -10,6 +10,9 @@ JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
+JASPER_CONF_OPTS = \
+	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
+	-DCMAKE_DISABLE_FIND_PACKAGE_LATEX=TRUE
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
