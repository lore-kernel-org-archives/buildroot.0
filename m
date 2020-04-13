From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 09:51:11 +0200
Subject: [Buildroot] [git commit] package/mc: fix typo BR2_PACKAGE_GMP ->
 BR2_PACKAGE_GPM
Message-ID: <20200413073710.615078E962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52d10583b3003764263b907acc0a58f1ee1766e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9cae8f557b9d3f18ccf3694155f452d6b55de5f6 introduced an optional
dependency on GPM, but got the name of the option wrong, and used
GMP. In fact, even the commit title was wrong.

This causes a build failure:

Makefile:578: *** gpm is in the dependency chain of mc that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:

  http://autobuild.buildroot.net/results/52fb92ae7dd55cba7d19862bb6cd89c80da9a4b6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mc/mc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 3deffeefee..f83905d89b 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -11,7 +11,7 @@ MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
-ifeq ($(BR2_PACKAGE_GMP),y)
+ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse
 MC_DEPENDENCIES += gpm
 else
