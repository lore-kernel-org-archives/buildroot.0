From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:17:56 +0200
Subject: [Buildroot] [git commit] package/kvazaar: add host-pkgconf
	dependency
Message-ID: <20170704231524.B76CB80780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05985ccb9d12bf90f2694641b334e8426a2c444c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build system use PKG_CHECK_MODULES.

checking pkg-config is at least version 0.9.0... ./configure: line 16886: output/host/usr/bin/pkg-config: No such file or directory
no

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvazaar/kvazaar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 30b8bda..f9149a7 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -10,6 +10,7 @@ KVAZAAR_LICENSE = LGPL-2.1+
 KVAZAAR_LICENSE_FILES = COPYING
 KVAZAAR_AUTORECONF = YES
 KVAZAAR_INSTALL_STAGING = YES
+KVAZAAR_DEPENDENCIES = host-pkgconf
 KVAZAAR_CONF_OPTS = --without-cryptopp
 
 $(eval $(autotools-package))
