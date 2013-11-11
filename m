From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 10:52:41 +0100
Subject: [Buildroot] [git commit] iozone: disable for uClibc 0.9.31
Message-ID: <20131111095409.583F09BBC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d71d7d162bb835f42403c930f19007fba90e2a91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc 0.9.31.x does not include the pthread_setaffinity_np GNU extension.

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/e21526c0c18733310d3fb322d79d5fff3a71af51/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iozone/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 26d4daa..33e12ca 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_UCLIBC_VERSION_0_9_31 # no pthread_setaffinity_np
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
