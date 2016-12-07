From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 22:12:00 +0100
Subject: [Buildroot] [git commit] php: disable FPM interface on Sparc
Message-ID: <20161207212310.4692A81E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5d23d4059cdc85956658ca6fca1dc86aa170029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building fails with "Sparc v8 and predecessors are not and will not be
supported (see bug report 53310)", so we disable FPM on Sparc.

Fixes:

  http://autobuild.buildroot.net/results/6a86f6cf07f6b6dccd7bfaab6d7682f9faf3527b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 3020bcc..57dabc4 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -29,6 +29,8 @@ config BR2_PACKAGE_PHP_SAPI_CLI
 config BR2_PACKAGE_PHP_SAPI_FPM
 	bool "FPM interface"
 	depends on BR2_USE_MMU
+	# "Sparc v8 and predecessors are not and will not be supported"
+	depends on !BR2_sparc
 	help
 	  PHP-FPM (FastCGI Process Manager)
 
