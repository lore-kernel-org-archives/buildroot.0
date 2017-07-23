From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:12:01 +0200
Subject: [Buildroot] [Patch v7 05/10] cargo-bootstrap: new package
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081206.7774-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package fetches a binary snapshot of Cargo, suitable to
bootstrap the host variants of the Rust compiler and Cargo, the package
manager.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/cargo-bootstrap/cargo-bootstrap.hash |  3 +++
 package/cargo-bootstrap/cargo-bootstrap.mk   | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 208c98d..ca0657f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -487,6 +487,7 @@ F:	package/xxhash/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	package/adwaita-icon-theme/
+F:	package/cargo-bootstrap/
 F:	package/darkhttpd/
 F:	package/eudev/
 F:	package/execline/
diff --git a/package/cargo-bootstrap/cargo-bootstrap.hash b/package/cargo-bootstrap/cargo-bootstrap.hash
new file mode 100644
index 0000000..28551aa
--- /dev/null
+++ b/package/cargo-bootstrap/cargo-bootstrap.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256 24d5e01b09ba0fb15c4b7ef4f527aca874ce2e0cebc3850fdc2535ac7e25b205  cargo-0.19.0-x86_64-unknown-linux-gnu.tar.gz
+sha256 30ffc32615626b746cbdd2c34d79b3de8ae9889ae56ab33feed9c3a1b9c170fc  cargo-0.19.0-i686-unknown-linux-gnu.tar.gz
diff --git a/package/cargo-bootstrap/cargo-bootstrap.mk b/package/cargo-bootstrap/cargo-bootstrap.mk
new file mode 100644
index 0000000..6814d78
--- /dev/null
+++ b/package/cargo-bootstrap/cargo-bootstrap.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cargo-bootstrap
+#
+################################################################################
+
+CARGO_BOOTSTRAP_VERSION = 0.19.0
+CARGO_BOOTSTRAP_SITE = https://static.rust-lang.org/dist/2017-06-08
+CARGO_BOOTSTRAP_SOURCE = cargo-$(CARGO_BOOTSTRAP_VERSION)-$(RUST_HOST_NAME).tar.gz
+CARGO_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
+CARGO_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+CARGO_BOOTSTRAP_STRIP_COMPONENTS = 1
+
+$(eval $(host-generic-package))
-- 
2.9.4
