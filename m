From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:42:22 +0200
Subject: [Buildroot] [git commit] package/uclibc: default to Y for LARGEFILE
Message-ID: <20150401205855.AF95B7F911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52ef47467c5929bfc0ccd5c87e8aa7adc1dbfc73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow us to remove largefile handling in the tree without
breaking things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3fb9b4d..e440559 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -87,11 +87,9 @@ config BR2_UCLIBC_CONFIG
 	  If unsure, use the default.
 
 config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
-	bool "Enable large file (files > 2 GB) support"
+	bool
 	select BR2_LARGEFILE
-	help
-	  Enable this option if you want your toolchain to support
-	  files bigger than 2 GB.
+	default y
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 	bool "Enable IPv6 support"
