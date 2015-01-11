From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jan 2015 20:35:15 +0100
Subject: [Buildroot] [git commit] openntpd: needs NPTL
Message-ID: <20150111193520.742BD803FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3b41df5dbe9c9f1fb03efeb1bed967cb780eef7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openntpd in fact needs nptl threads, basic threads aren't enough. Fixes:
http://autobuild.buildroot.net/results/f4d/f4dd964231a5dbbc12a7237127fa9c45d6aa0d06/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 3d545e4..192576f 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
 	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork ()
 	depends on !BR2_PACKAGE_NTP # conflicting binaries
 	help
@@ -12,6 +12,6 @@ config BR2_PACKAGE_OPENNTPD
 
 	  http://www.openntpd.org/
 
-comment "openntpd needs a toolchain w/ threads, IPv6"
+comment "openntpd needs a toolchain w/ NPTL, IPv6"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
