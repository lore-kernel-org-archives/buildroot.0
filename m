From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Aug 2012 10:55:24 +0200
Subject: [Buildroot] [git commit] microperl: uses fork(),
	only available on MMU platforms
Message-ID: <20120826090843.44F8099396@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a9563b828170faa7d409363af44614051889d81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/0d5e272b594bc6cc84df291134e2b23d33b97d17/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/microperl/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/microperl/Config.in b/package/microperl/Config.in
index 256e271..66bbedd 100644
--- a/package/microperl/Config.in
+++ b/package/microperl/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MICROPERL
 	bool "microperl"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  Perl without operating-specific functions such as readdir.
 
