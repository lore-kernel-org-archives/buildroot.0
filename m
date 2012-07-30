From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 21:20:02 +0200
Subject: [Buildroot] [git commit] bash: add depends on MMU
Message-ID: <20120730192040.B561A90926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99492e0dfacc53d1fbfa50ac10dac35630e120a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the build failure at

  http://autobuild.buildroot.org/results/0434d99b51f535ac73bfcf1968b1c2b81b44ba61/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bash/Config.in b/package/bash/Config.in
index 9ee46e8..228d5a4 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_BASH
 	bool "bash"
 	select BR2_PACKAGE_NCURSES
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  The standard GNU Bourne again shell.
 
