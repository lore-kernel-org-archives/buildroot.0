From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:42:21 +0100
Subject: [Buildroot] [git commit] iw: using the git version fixes build with
	new libnl-3
Message-ID: <20111226160333.E67968FDD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c4a7dc9036591a0eaf14eb52f7456657603733f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current git version copes well with libnl-3, so use this one until
the next official release is made.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index ab6c676..d89fc6c 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-IW_VERSION = 3.2
-IW_SOURCE = iw-$(IW_VERSION).tar.bz2
-IW_SITE = http://wireless.kernel.org/download/iw
+IW_VERSION = a82abc2cac9dea7def53070565201145c76c8c6c
+IW_SITE = git://git.sipsolutions.net/iw.git
 IW_DEPENDENCIES = host-pkg-config libnl
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
