From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:35 -0000
Subject: [Buildroot] [git commit branch/next] iperf: needs MMU
Message-ID: <20120802195233.3F4F296EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b3f94f9b0a600a103aee739bb274e80298c6151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iperf/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iperf/Config.in b/package/iperf/Config.in
index c4c25b3..c284bfd 100644
--- a/package/iperf/Config.in
+++ b/package/iperf/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_IPERF
 	bool "iperf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Internet Protocol bandwidth measuring tool for measuring
 	  TCP/UDP performance.
