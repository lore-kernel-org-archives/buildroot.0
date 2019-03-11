From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Mar 2019 22:19:20 +0100
Subject: [Buildroot] [git commit] package/czmq: use --without-docs
Message-ID: <20190311211630.C1BEC8EC55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82adf608cd19787c9c57fbb8ac15b07ff5164067
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use --without-docs option instead of setting
ac_cv_prog_czmq_have_asciidoc=no

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/czmq/czmq.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index e6445be42e..1c9493cb76 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -12,10 +12,6 @@ CZMQ_DEPENDENCIES = zeromq host-pkgconf
 CZMQ_LICENSE = MPL-2.0
 CZMQ_LICENSE_FILES = LICENSE
 
-# asciidoc is a python script that imports unicodedata, which is not in
-# host-python, so disable asciidoc entirely.
-CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
-
-CZMQ_CONF_OPTS = --disable-Werror
+CZMQ_CONF_OPTS = --disable-Werror --without-docs
 
 $(eval $(autotools-package))
