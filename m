From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:07:16 -0800
Subject: [Buildroot] [git commit] legacy: evtest is dropped from input-tools
	package
Message-ID: <20121130201153.746A39940D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c430fab22242efd4251a6fc1ccba87f4d732e303
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We select BR2_PACKAGE_EVTEST automatically. This has only limited use:
when the LEGACY_CHECK menu is disabled in menuconfig (or even oldconfig),
it will also unselect BR2_PACKAGE_EVTEST again. Still, it can serve as a
hint of how to fix things.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bc8784..04ccb92 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -48,4 +48,11 @@ if BR2_LEGACY_CHECK_2012_11
 # Legacy options from 2012.08
 #
 
+config BR2_PACKAGE_INPUT_TOOLS_EVTEST
+	bool "input-tools evtest is now a separate package evtest"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EVTEST
+	help
+	  The evtest program from input-tools is now a separate package.
+
 endif
