From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 22:11:12 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/linux-headers:
 add help text for manual header selection
Message-ID: <20180927201201.F20428900B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75997e34ab290fa5446c5262c1f30cd45e2053f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Add kconfig help text that explains how to manually specify an
official Linux version to use for the kernel headers.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3beba26d7657840c07bf014e33f9e80b6f1b09af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index db0f73fb9c..10975cde10 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -69,6 +69,14 @@ config BR2_KERNEL_HEADERS_4_15
 
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
+	help
+	  This option allows you to use a specific official version from
+	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
+
+	  Note: you cannot use this option to select a _longterm_ 2.6
+	  kernel, because these kernels are not located at the standard
+	  URL at kernel.org. Instead, select "Custom tarball" and
+	  specify the right URL directly.
 
 endchoice
 
