From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:48:00 +0100
Subject: [Buildroot] [git commit] package/w_scan: requires kernel headers >=
	3.0
Message-ID: <20140301193723.7D7A496DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e583d1350793c377a01c8f4df484e056934aa51a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It needs DVB API version 5.3 or later, introduced in linux 3.0.

Fixes:
    http://autobuild.buildroot.net/results/6e7/6e7c691099a8f3eef4fc84860ceb1a94f25873eb

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/w_scan/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
index 4487b0a..02cb2c3 100644
--- a/package/w_scan/Config.in
+++ b/package/w_scan/Config.in
@@ -1,5 +1,9 @@
+comment "w_scan needs a toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 config BR2_PACKAGE_W_SCAN
 	bool "w_scan"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  w_scan is a small command line utility used to perform frequency
