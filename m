From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 21:53:53 +0100
Subject: [Buildroot] [git commit] zyre: remove unnecessary autoreconf options
Message-ID: <20140228133417.84C009BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e40a1005f51d10784db295797ed270a130d79d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default $(PKG)_AUTORECONF_OPT already includes the -i and -f flags,
so there is no point in specifying these in the package makefile. Further,
the -v option to autoreconf is not required.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 405697a..66952aa 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -11,7 +11,6 @@ ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = filemq
 ZYRE_AUTORECONF = YES
-ZYRE_AUTORECONF_OPT = --install --force --verbose
 
 define ZYRE_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
