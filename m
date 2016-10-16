From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 17:49:50 +0200
Subject: [Buildroot] [git commit] fwup: add dependency on host-pkgconf
Message-ID: <20161016155117.2DC4381840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15c950731d6cd950bd74748ed121a994d65305f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fwup configure.ac uses PKG_CHECK_MODULES(), and we're
autoreconfiguring this package, so we should depend on host-pkgconf.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fwup/fwup.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 3d3e3be..d87bdca 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -8,8 +8,8 @@ FWUP_VERSION = v0.8.2
 FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
-FWUP_DEPENDENCIES = libconfuse libarchive libsodium
-HOST_FWUP_DEPENDENCIES = host-libconfuse host-libarchive host-libsodium
+FWUP_DEPENDENCIES = host-pkgconf libconfuse libarchive libsodium
+HOST_FWUP_DEPENDENCIES = host-pkgconf host-libconfuse host-libarchive host-libsodium
 FWUP_AUTORECONF = YES
 FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
 
