From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 21:53:49 +0100
Subject: [Buildroot] [git commit] giblib: remove unnecessary autoreconf
	options
Message-ID: <20140228133417.7C58C9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c06693f7a8a2625e02903aae2693f51cb36072a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default $(PKG)_AUTORECONF_OPT already includes the -i flag,
so there is no point in specifying this in the package makefile.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giblib/giblib.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index b955943..6d1ebb8 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -9,7 +9,6 @@ GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
-GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 GIBLIB_CONFIG_SCRIPTS = giblib-config
