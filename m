From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 09:52:09 +0100
Subject: [Buildroot] [git commit] alsa-utils: add dependency on host-pkgconf
Message-ID: <20131204093549.813D69BE5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c38909db34038f02dd75e3968f03967739245824
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The alsa-utils configure script will use pkg-config if available,
so make sure that it is available.

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index b951112..e755adf 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -10,7 +10,7 @@ ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
-ALSA_UTILS_DEPENDENCIES = host-gettext alsa-lib \
+ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 
 ALSA_UTILS_CONF_ENV = \
