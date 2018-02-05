From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:47 +0100
Subject: [Buildroot] [git commit] cargo-bin: new package
Message-ID: <20180205140233.2E9A48746B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7a189c661acaabafb39d8e35dfd71393343a282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package fetches a binary version of Cargo, suitable to
bootstrap the host variants of the Rust compiler and Cargo, the package
manager.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                       |  1 +
 package/cargo-bin/cargo-bin.hash |  8 ++++++++
 package/cargo-bin/cargo-bin.mk   | 13 +++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e04f872ac..70ca569feb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -541,6 +541,7 @@ F:	package/xxhash/
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
 F:	package/adwaita-icon-theme/
+F:	package/cargo-bin/
 F:	package/darkhttpd/
 F:	package/eudev/
 F:	package/execline/
diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
new file mode 100644
index 0000000000..ea121547b4
--- /dev/null
+++ b/package/cargo-bin/cargo-bin.hash
@@ -0,0 +1,8 @@
+# From https://static.rust-lang.org/dist/cargo-0.24.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256 6ffc847e0ee2a1273223ce500f7b212d051e99a6d234e34585d0c55e21a963ea  cargo-0.24.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/cargo-0.24.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256 93b953c8c7a2088aef952de8dccd7f6ccf9b21bf94b735d3909961ffe831da8c  cargo-0.24.0-x86_64-unknown-linux-gnu.tar.xz
+# Locally generated
+sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256 8bd89f9222dc80292f4107347103b693ac66f3a083371f0629ccf42338abe880  LICENSE-THIRD-PARTY
diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
new file mode 100644
index 0000000000..0f235748ff
--- /dev/null
+++ b/package/cargo-bin/cargo-bin.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cargo-bin
+#
+################################################################################
+
+CARGO_BIN_VERSION = 0.24.0
+CARGO_BIN_SITE = https://static.rust-lang.org/dist
+CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+CARGO_BIN_LICENSE = Apache-2.0 or MIT
+CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(host-generic-package))
