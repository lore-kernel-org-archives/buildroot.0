From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 31 Jan 2020 12:27:46 +0100
Subject: [Buildroot] [RFC PATCH 1/4] doc/adding-packages-cargo: update
 Config.in sample
Message-ID: <20200131112749.30915-1-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add "select BR2_PACKAGE_HOST_RUSTC" as it is needed.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-cargo.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b83f86e9e6..bb078b6981 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -18,10 +18,11 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 01: config BR2_PACKAGE_FOO
 02: 	bool "foo"
 03: 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-04: 	help
-05: 	  This is a comment that explains what foo is.
-06:
-07: 	  http://foosoftware.org/foo/
+04: 	select BR2_PACKAGE_HOST_RUSTC
+05: 	help
+06: 	  This is a comment that explains what foo is.
+07:
+08: 	  http://foosoftware.org/foo/
 ---------------------------
 
 ==== Cargo-based package's +.mk+ file
-- 
2.17.1
