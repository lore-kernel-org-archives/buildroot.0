From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 15:52:09 +0100
Subject: [Buildroot] [git commit] gd: needs host-pkgconf
Message-ID: <20141125145743.9C7277FEF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46c644310c87e1851eb1420cae7c07f3a1a347ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure uses PKG_CHECK_MODULES, so it needs to depend on host-pkgconf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 927dfb2..d0fd572 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -13,6 +13,7 @@ GD_LICENSE_FILES = COPYING
 
 GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPTS = --without-x --disable-rpath
+GD_DEPENDENCIES = host-pkgconf
 
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
