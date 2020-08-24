From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:54:54 +0200
Subject: [Buildroot] [git commit] package/nut: install to staging
Message-ID: <20200902161636.2930F85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb73b7250d0dbd5c81bc25e02978d73cf93667eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for collectd plugin.

Added --with-dev to enable install of pkgconfig files:
https://github.com/networkupstools/nut/blob/master/lib/Makefile.am#L3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nut/nut.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 4ea9947128..593d19926a 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -9,6 +9,7 @@ NUT_VERSION = $(NUT_VERSION_MAJOR).4
 NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
+NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf
 
 # Our patch changes m4 macros, so we need to autoreconf
@@ -21,6 +22,7 @@ NUT_MAKE = $(MAKE1)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
+	--with-dev \
 	--without-hal
 
 # For uClibc-based toolchains, nut forgets to link with -lm
