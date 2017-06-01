From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:28:32 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/mxml: fix
	download URL
Message-ID: <20170601144623.D09CF7FC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a40c4d70ed0765a9aeb918458a6d66e4c9e4de05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The project moved to github, the current download URL is broken:

$ wget -q  http://www.msweet.org/files/project3/mxml-2.10.tar.gz
$ file mxml-2.10.tar.gz
mxml-2.10.tar.gz: HTML document, UTF-8 Unicode text, with very long lines

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit eca61c93d5e6061a0749c94f7a4b5da73e332777)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mxml/mxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index f36c75c..1ed5eb9 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MXML_VERSION = 2.10
-MXML_SITE = http://www.msweet.org/files/project3
+MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/release-$(MXML_VERSION)
 MXML_LICENSE = LGPLv2+ with exceptions
 MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
