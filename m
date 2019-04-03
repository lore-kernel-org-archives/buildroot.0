From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  3 Apr 2019 15:45:53 +0200
Subject: [Buildroot] [PATCH] package/biosdevname: fix configure failure
Message-ID: <20190403134553.126164-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On version bump to 0.7.3 SITE has been modified to use github
instead of http tarball. Github tarball doesn't contain ./configure file
differently from 0.7.2 http tarball, so need to autoreconf and generate
it.

Add BIOSDEVNAME_AUTORECONF = YES to package recipe.

Fixes:
http://autobuild.buildroot.net/results/3fc/3fc31982af87210b66cbe412410d11c85c9cebd6/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/biosdevname/biosdevname.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/biosdevname/biosdevname.mk b/package/biosdevname/biosdevname.mk
index 6036e24c09..574608c508 100644
--- a/package/biosdevname/biosdevname.mk
+++ b/package/biosdevname/biosdevname.mk
@@ -10,5 +10,6 @@ BIOSDEVNAME_LICENSE = GPL
 BIOSDEVNAME_LICENSE_FILES = COPYING
 BIOSDEVNAME_CONF_OPTS = --exec-prefix=/
 BIOSDEVNAME_DEPENDENCIES = pciutils udev zlib
+BIOSDEVNAME_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.17.1
