From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:00:50 +0100
Subject: [Buildroot] [git commit] package/pkgconf: purge trailing '/' from
 PKGCONF_SITE
Message-ID: <20181210205813.0D875840EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8da467b489e753a9eaae132ba6271417dade7263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<PKG>_SITE cannot have a trailing slash.

This was not detected by the check in generic-package because it is a
host-only package without Config.in symbol.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkgconf/pkgconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 5352f5c962..e3c73fd405 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PKGCONF_VERSION = 1.5.3
-PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf/
+PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
