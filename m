From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 21:52:23 +0100
Subject: [Buildroot] [git commit] libtpl: remove unnecessary autoreconf
	options
Message-ID: <20140228133417.70D679BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd59a5dafa97a9e43d995b33163f3856644485ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default $(PKG)_AUTORECONF_OPT already includes the -i and -f flags,
so there is no point in specifying these in the package makefile.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtpl/libtpl.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index ff05991..1d4becf 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -11,7 +11,6 @@ LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
 
 LIBTPL_AUTORECONF = YES
-LIBTPL_AUTORECONF_OPT = --install --force
 
 define LIBTPL_CREATE_MISSING_FILES
 	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog $(@D)/COPYING
