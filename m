From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:59 +0100
Subject: [Buildroot] [RFC PATCH 7/7] docs/manual: cargo packages depend on
 host-rustc
In-Reply-To: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
References: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191105211259.27673-8-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As Cargo is either installed by host-rust or host-rust-bin, the
Cargo-based packages should depend on host-rustc.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-cargo.txt | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b6029e1eed..b83f86e9e6 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -18,11 +18,10 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 01: config BR2_PACKAGE_FOO
 02: 	bool "foo"
 03: 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-04: 	select BR2_PACKAGE_HOST_CARGO
-05: 	help
-06: 	  This is a comment that explains what foo is.
-07:
-08: 	  http://foosoftware.org/foo/
+04: 	help
+05: 	  This is a comment that explains what foo is.
+06:
+07: 	  http://foosoftware.org/foo/
 ---------------------------
 
 ==== Cargo-based package's +.mk+ file
@@ -44,7 +43,7 @@ package. Let's start with an example:
 10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12:
-13: FOO_DEPENDENCIES = host-cargo
+13: FOO_DEPENDENCIES = host-rustc
 14:
 15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
-- 
2.21.0
