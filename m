From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 09:32:07 +0200
Subject: [Buildroot] [PATCH] exim: requires thread support
Message-ID: <1409297527-27633-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.net/results/98a1acb58665e6cd2df354fc63afef1d4606c6e0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index bd4ef1f..230ac86 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -1,6 +1,10 @@
+comment "exim needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_EXIM
 	bool "exim"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_BERKELEYDB
 	help
-- 
2.0.0
