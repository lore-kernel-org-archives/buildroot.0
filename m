From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Dec 2016 16:10:15 +0100
Subject: [Buildroot] [PATCH] doc/manual: document the new waf-package infra
	variables
Message-ID: <1481469015-31089-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Document LIBFOO_WAF_OPTS, LIBFOO_BUILD_OPTS,
LIBFOO_INSTALL_STAGING_OPTS and LIBFOO_INSTALL_TARGET_OPTS.

Also document LIBFOO_CONF_OPTS which was missing in waf-package
reference.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-waf.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
index 3c0dbe4..67c6eff 100644
--- a/docs/manual/adding-packages-waf.txt
+++ b/docs/manual/adding-packages-waf.txt
@@ -65,3 +65,20 @@ also be defined.
   default, then Buildroot will use the waf executable provided in the
   package source tree; if set to +YES+, then Buidlroot will download,
   install waf as a host tool and use it to build the package.
+
+* +LIBFOO_WAF_OPTS+, to specify additional options to pass to the waf
+  script each time it is called. By default, empty.
+
+* +LIBFOO_CONF_OPTS+, to specify additional options to pass to the
+  waf script for the configuration step. By default, empty.
+
+* +LIBFOO_BUILD_OPTS+, to specify additional options to pass to the
+  waf script for the build step. By default, empty.
+
+* +LIBFOO_INSTALL_STAGING_OPTS+, to specify additional options used
+  by the waf script to install the package to the staging directory.
+  By default, empty.
+
+* +LIBFOO_INSTALL_TARGET_OPTS+, to specify additional options used
+  by the waf script to install the package to the target directory.
+  By default, empty.
-- 
2.5.5
