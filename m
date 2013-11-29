From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 11:27:38 +0100
Subject: [Buildroot] [git commit] libpfm4: disable on avr32
Message-ID: <20131129102845.C19BE9B8A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1842ad7f93897fa7dd0b0a3e6ae0759b120472bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The perf_event_open syscall is not available on avr32. Fixes build failures
such as the following.

  http://autobuild.buildroot.net/results/38f/38fa81315be448c409b9af29f92621fcf5676f71/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpfm4/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
index 6b491a4..3908e78 100644
--- a/package/libpfm4/Config.in
+++ b/package/libpfm4/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPFM4
 	bool "libpfm4"
+	depends on !BR2_avr32 # no perf_event_open
 	help
 	  A helper library to help encode Performance Events to use with
 	  Operating system kernels performance monitoring interfaces.
