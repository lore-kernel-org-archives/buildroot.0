From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:32:40 +0100
Subject: [Buildroot] [git commit] package/powertop: needs gettextize
Message-ID: <20150324233243.720828180C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87f228a4e1654fccaec5593d2340811ee35a899b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8e7/8e7d1f039b57400b1a6f9c14755b35528a457031/
http://autobuild.buildroot.net/results/4e5/4e5a8f49c80c363b5fb35332e34206c9a4fe4120/
http://autobuild.buildroot.net/results/658/658e11f5b0bf3347a50a387b6271eb43c45025fb/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powertop/powertop.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index b253a56..4446bc9 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -13,6 +13,7 @@ POWERTOP_LICENSE_FILES = COPYING
 POWERTOP_AUTORECONF = YES
 
 ifeq ($(BR2_NEEDS_GETTEXT),y)
+POWERTOP_GETTEXTIZE = YES
 POWERTOP_DEPENDENCIES += gettext
 POWERTOP_CONF_ENV += LIBS='-lintl'
 endif
