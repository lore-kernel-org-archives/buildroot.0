From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:51:17 +0200
Subject: [Buildroot] [git commit] package/mxml: fix download URL
Message-ID: <20170529195238.DFD3382563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eca61c93d5e6061a0749c94f7a4b5da73e332777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project moved to github, the current download URL is broken:

$ wget -q  http://www.msweet.org/files/project3/mxml-2.10.tar.gz
$ file mxml-2.10.tar.gz
mxml-2.10.tar.gz: HTML document, UTF-8 Unicode text, with very long lines

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mxml/mxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 7c48380..ac270bd 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MXML_VERSION = 2.10
-MXML_SITE = http://www.msweet.org/files/project3
+MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/release-$(MXML_VERSION)
 MXML_LICENSE = LGPL-2.0+ with exceptions
 MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
