From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Jun 2013 21:43:34 +0200
Subject: [Buildroot] [git commit] libserial: prevent documentation from
	being build
Message-ID: <20130623200855.8DE619B141@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e0aff3b5cf2f83a3ddd31dfd572b29a8288f6be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If docbook2pdf is present on the host, the documentation is built, no
matter all the --disable-doc*
But forcing ac_cv_prog_DOCBOOK2PDF to no tells configure that
docbook2pdf is absent, and thus the documentation is not built.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libserial/libserial.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index c5142c5..d2c928b 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -10,4 +10,6 @@ LIBSERIAL_INSTALL_STAGING = YES
 LIBSERIAL_LICENSE = GPLv2+
 LIBSERIAL_LICENSE_FILES = COPYING
 
+LIBSERIAL_CONF_ENV = ac_cv_prog_DOCBOOK2PDF=no
+
 $(eval $(autotools-package))
