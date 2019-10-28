From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 17:38:04 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] docs/manual: fix
 Config.in option that cargo packages must depend on
Message-ID: <20191028163231.B85328B7C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08c7ad11b84687ddc634fee9b4c7655b2bf4cdd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Back in commit 025b863e6facb7b219b82ee6ee7a7916c2c3c47e, the option
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was introduced, to
separate the option that host packages needing Rust should depend on
(BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS) from the option that target
packages needing Rust should depend on
(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).

Since the example in the manual is showing a target package, we must
use BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sam Voss <sam.voss@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit edee45b8431b05c28a22da4a29cc89af47ba1b88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-cargo.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b7fc09acfe..b6029e1eed 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -17,7 +17,7 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 ---------------------------
 01: config BR2_PACKAGE_FOO
 02: 	bool "foo"
-03: 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+03: 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 04: 	select BR2_PACKAGE_HOST_CARGO
 05: 	help
 06: 	  This is a comment that explains what foo is.
