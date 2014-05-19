From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 12:20:52 +0000
Subject: [Buildroot] [PATCH v4 1/3] isl: new package
In-Reply-To: <1400502054-9389-1-git-send-email-scjthm@live.com>
References: <1400502054-9389-1-git-send-email-scjthm@live.com>
Message-ID: <BLU436-SMTP989DB12537225309D988CEA8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

isl is a library for manipulating sets and relations of integer points
bounded by linear constraints.

isl is needed for the optional graphite optimisations that are supported
by gcc since version 4.5. Therefore this package is required for the
toolchain to support graphite.

Graphite optimisations primarily involve loop blocking flattening and
interchage so are probably of mimimal use in an embedded system where
small sizes are favoured.

Signed-off-by: Steve Thomas <scjthm@live.com>
---
Changes v3 -> v4:
    - removing the parts not needed

Changes v2 -> v3:
    - removed packages from Config.in
    - disabled target builds
    - added empty line to commit messages
    - removed isl patch as different version used

Changes v1 -> v2:
    - added more lucid and verbose description in commit messages
    - fixed the url and removed the sources files
    - add complete graphite as three commits yet a single patch
---
 package/isl/isl.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/isl/isl.mk

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
new file mode 100644
index 0000000..68de1aa
--- /dev/null
+++ b/package/isl/isl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# isl
+#
+################################################################################
+
+ISL_VERSION = 0.11.1
+ISL_SITE = http://isl.gforge.inria.fr/
+ISL_LICENSE = MIT
+ISL_LICENSE_FILES = LICENSE
+ISL_INSTALL_STAGING = YES
+ISL_DEPENDENCIES = gmp
+
+$(eval $(host-autotools-package))
-- 
1.9.3
