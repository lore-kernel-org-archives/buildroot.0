From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:53:34 +0100
Subject: [Buildroot] [git commit] dstat: propagate python dependencies
Message-ID: <20141101140727.29273B282D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e74a5967f1da1d0a5095bf710242c2d9c34beba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix comment of the toolchain dependencies.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dstat/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 62a392a..63db87b 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DSTAT
 	bool "dstat"
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_USE_MMU # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	select BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
@@ -20,6 +21,6 @@ config BR2_PACKAGE_DSTAT
 
 	  http://dag.wieers.com/home-made/dstat/
 
-comment "dstat needs a toolchain w/ wchar"
+comment "dstat needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
