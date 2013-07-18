From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 18 Jul 2013 20:32:33 +0200
Subject: [Buildroot] [PATCH 2/3] arc: binutils: Go from 2.19-arc to
	2.23.2-arc
In-Reply-To: <1374172354-3248-1-git-send-email-mjonker@synopsys.com>
References: <1374172354-3248-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1374172354-3248-3-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 .../binutils/2.19-arc/add-empty-info-files.patch   |   72 --------------------
 package/binutils/Config.in.host                    |    2 +-
 2 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100644 package/binutils/2.19-arc/add-empty-info-files.patch

diff --git a/package/binutils/2.19-arc/add-empty-info-files.patch b/package/binutils/2.19-arc/add-empty-info-files.patch
deleted file mode 100644
index 90de429..0000000
--- a/package/binutils/2.19-arc/add-empty-info-files.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-binutils: add empty info files to remove makeinfo dependency
-
-Signed-off-by: Mischa jonker <mjonker@synopsys.com>
----
- bfd/doc/bfd.info           |    1 +
- binutils/doc/binutils.info |    1 +
- etc/configure.info         |    1 +
- etc/standards.info         |    1 +
- gas/doc/as.info            |    1 +
- gprof/gprof.info           |    1 +
- ld/ld.info                 |    1 +
- 7 files changed, 7 insertions(+), 0 deletions(-)
- create mode 100644 bfd/doc/bfd.info
- create mode 100644 binutils/doc/binutils.info
- create mode 100644 etc/configure.info
- create mode 100644 etc/standards.info
- create mode 100644 gas/doc/as.info
- create mode 100644 gprof/gprof.info
- create mode 100644 ld/ld.info
-
-diff --git a/bfd/doc/bfd.info b/bfd/doc/bfd.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/bfd/doc/bfd.info
-@@ -0,0 +1 @@
-+
-diff --git a/binutils/doc/binutils.info b/binutils/doc/binutils.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/binutils/doc/binutils.info
-@@ -0,0 +1 @@
-+
-diff --git a/etc/configure.info b/etc/configure.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/etc/configure.info
-@@ -0,0 +1 @@
-+
-diff --git a/etc/standards.info b/etc/standards.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/etc/standards.info
-@@ -0,0 +1 @@
-+
-diff --git a/gas/doc/as.info b/gas/doc/as.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/gas/doc/as.info
-@@ -0,0 +1 @@
-+
-diff --git a/gprof/gprof.info b/gprof/gprof.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/gprof/gprof.info
-@@ -0,0 +1 @@
-+
-diff --git a/ld/ld.info b/ld/ld.info
-new file mode 100644
-index 0000000..8b13789
---- /dev/null
-+++ b/ld/ld.info
-@@ -0,0 +1 @@
-+
--- 
-1.7.0.4
-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9ddaed7..c2d2495 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -44,7 +44,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.19-arc"	if BR2_arc
+	default "2.23.2-arc"	if BR2_arc
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
-- 
1.7.9.5
