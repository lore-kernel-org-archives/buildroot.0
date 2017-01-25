From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:07:02 +1300
Subject: [Buildroot] [git commit] package/lcms2: remove empty variable
	LCMS2_CONF_OPTS
Message-ID: <20170125100712.CE98981914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d021262040bc092d3d79d1332bf13a019b1425c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced 2013 with the commit adding this package
https://git.buildroot.net/buildroot/commit/package/lcms2?id=901282aa6e330c5e61ab25a83ba68e443cb3aec2
without any notice why it is needed.

The package compiles fine without it so let's remove it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lcms2/lcms2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 8d0609e..9a4cf5e 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -10,8 +10,6 @@ LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_INSTALL_STAGING = YES
 
-LCMS2_CONF_OPTS = \
-
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LCMS2_CONF_OPTS += --with-jpeg
 LCMS2_DEPENDENCIES += jpeg
