From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 00:15:24 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: add legacy handling for
	the recently removed BR2_x86_generic option
Message-ID: <20141108231828.3EB07B3824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a52bad854fc6b143c5036cedf33320a6434ed44c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot automatically falls back to a sensible CPU variant, but inform the
user of the change anyway so they are aware of it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 95f77c3..d60f4eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_x86_generic
+	bool "x86 generic variant has been removed"
+	select BR2_LEGACY
+	help
+	  The generic x86 CPU variant has been removed. Use another
+	  CPU variant insted.
+
 config BR2_GCC_VERSION_4_4_X
 	bool "gcc 4.4.x has been removed"
 	select BR2_LEGACY
