From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Jun 2016 00:27:09 +0200
Subject: [Buildroot] [PATCH 3/4] cargo-bootstrap: new package
In-Reply-To: <1466807230-9052-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466807230-9052-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1466807230-9052-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package fetches a binary snapshot of Cargo, suitable for the
host, in order to bootstrap Cargo.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo-bootstrap/cargo-bootstrap.hash |  3 +++
 package/cargo-bootstrap/cargo-bootstrap.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk

diff --git a/package/cargo-bootstrap/cargo-bootstrap.hash b/package/cargo-bootstrap/cargo-bootstrap.hash
new file mode 100644
index 0000000..d3ed631
--- /dev/null
+++ b/package/cargo-bootstrap/cargo-bootstrap.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256 55ad9a8929303b4e06c18d0dd30b0d6296da784606d9c55cce98d5d7fc39a0b2 cargo-nightly-x86_64-unknown-linux-gnu.tar.gz
+sha256 b2a1c4c33fb9274771c8d830cd8ac07f7ae96af341fa30399d6929ffd6c8b425 cargo-nightly-i686-unknown-linux-gnu.tar.gz
diff --git a/package/cargo-bootstrap/cargo-bootstrap.mk b/package/cargo-bootstrap/cargo-bootstrap.mk
new file mode 100644
index 0000000..13fbcde
--- /dev/null
+++ b/package/cargo-bootstrap/cargo-bootstrap.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cargo-bootstrap
+#
+################################################################################
+
+CARGO_BOOTSTRAP_VERSION = 2016-03-21
+CARGO_BOOTSTRAP_SITE = https://static.rust-lang.org/cargo-dist/$(CARGO_BOOTSTRAP_VERSION)
+CARGO_BOOTSTRAP_SOURCE = cargo-nightly-$(HOSTARCH)-unknown-linux-gnu.tar.gz
+CARGO_BOOTSTRAP_LICENSE = Apache-2.0, MIT
+CARGO_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+CARGO_BOOTSTRAP_STRIP_COMPONENTS = 1
+
+$(eval $(host-generic-package))
-- 
2.4.11
