From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Sep 2019 16:04:27 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/augeas: drop
 AUTORECONF
Message-ID: <20190924140906.6E3CB8F2DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=381176ba3b1ea834cc0f5ec0fdbfbe79c7f37604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

autoreconf is not needed since bump to version 1.10.1 in
commit 3cd6faa04cef1b1ebf5c5d47eeaf7e812ed02cb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75baf4764c7f63383243cd244efcb3ac677fdef4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/augeas/augeas.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index 8cb4f74e41..7897d8f493 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -11,9 +11,6 @@ AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
 AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
-# patching examples/Makefile.am, can be removed when updating from version 1.9.0
-AUGEAS_AUTORECONF = YES
-
 AUGEAS_CONF_OPTS = --disable-gnulib-tests
 
 # Remove the test lenses which occupy about 1.4 MB on the target
