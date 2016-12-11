From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:03:59 +0100
Subject: [Buildroot] [git commit] doc/manual: document the new waf-package
	infra variables
Message-ID: <20161211170411.E884A819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65395920b51a5c2c9775f6b23212b765ca9a991c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Document LIBFOO_WAF_OPTS, LIBFOO_BUILD_OPTS, LIBFOO_INSTALL_STAGING_OPTS
and LIBFOO_INSTALL_TARGET_OPTS.

Also document LIBFOO_CONF_OPTS which was missing in waf-package
reference.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-waf.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
index 3c0dbe4..43b557c 100644
--- a/docs/manual/adding-packages-waf.txt
+++ b/docs/manual/adding-packages-waf.txt
@@ -65,3 +65,21 @@ also be defined.
   default, then Buildroot will use the waf executable provided in the
   package source tree; if set to +YES+, then Buidlroot will download,
   install waf as a host tool and use it to build the package.
+
+* +LIBFOO_WAF_OPTS+, to specify additional options to pass to the
+  +waf+ script at every step of the package build process: configure,
+  build and installation. By default, empty.
+
+* +LIBFOO_CONF_OPTS+, to specify additional options to pass to the
+  +waf+ script for the configuration step. By default, empty.
+
+* +LIBFOO_BUILD_OPTS+, to specify additional options to pass to the
+  +waf+ script during the build step. By default, empty.
+
+* +LIBFOO_INSTALL_STAGING_OPTS+, to specify additional options to pass
+  to the +waf+ script during the staging installation step.  By default,
+  empty.
+
+* +LIBFOO_INSTALL_TARGET_OPTS+, to specify additional options to pass
+  to the +waf+ script during the target installation step.  By default,
+  empty.
