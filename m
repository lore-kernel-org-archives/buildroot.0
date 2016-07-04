From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 00:10:05 +0200
Subject: [Buildroot] [git commit] gnutls: update legal info
Message-ID: <20160704221225.1719581D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2844807a7e6a590dd42642a5484baf683cef73b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GnuTLS core library is licensed under LGPLv2.1+ while gnutls-openssl
library is licensed under GPLv3+. Annotate the license with components.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas:
 - add comment about the license of the "core library" since some files
   seems to be mistakenly under LGPLv3+ even though the library is
   licensed under LGPLv2.1+.
 - add the README file in the license information, since it contains a
   lot of useful details.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 76d2ca2..3cb08d1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,8 +8,12 @@ GNUTLS_VERSION_MAJOR = 3.4
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
-GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
-GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
+# README says that the core library is under LGPLv2.1+, but a few
+# files in libdane specify LGPLv3+. It seems to be a mistake, and we
+# therefore trust the README file here. A bug was reported upstream at
+# https://gitlab.com/gnutls/gnutls/issues/109.
+GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
+GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER README
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
