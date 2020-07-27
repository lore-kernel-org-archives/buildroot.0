From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:31:00 +0200
Subject: [Buildroot] [git commit] docs/manual: cargo packages depend on
 host-rustc
Message-ID: <20200727112613.6002F88E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cd3e0f5562d1f1c391e8df9fc6a8a76cb5a2f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Cargo is either installed by host-rust or host-rust-bin, the
Cargo-based packages should depend on host-rustc.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
[Arnout: also select HOST_RUSTC in Config.in]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-cargo.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b6029e1eed..bb078b6981 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -18,7 +18,7 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 01: config BR2_PACKAGE_FOO
 02: 	bool "foo"
 03: 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-04: 	select BR2_PACKAGE_HOST_CARGO
+04: 	select BR2_PACKAGE_HOST_RUSTC
 05: 	help
 06: 	  This is a comment that explains what foo is.
 07:
@@ -44,7 +44,7 @@ package. Let's start with an example:
 10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12:
-13: FOO_DEPENDENCIES = host-cargo
+13: FOO_DEPENDENCIES = host-rustc
 14:
 15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
