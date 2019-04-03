From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Apr 2019 21:52:01 +0200
Subject: [Buildroot] [git commit] package/biosdevname: fix configure failure
Message-ID: <20190403195729.D478D8B765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e70c82740299bfb5b863ab0b813cd5fb230349e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On version bump to 0.7.3 SITE has been modified to use github
instead of http tarball. Github tarball doesn't contain ./configure file
differently from 0.7.2 http tarball, so need to autoreconf and generate
it.

Add BIOSDEVNAME_AUTORECONF = YES to package recipe.

Fixes:
http://autobuild.buildroot.net/results/3fc/3fc31982af87210b66cbe412410d11c85c9cebd6/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
