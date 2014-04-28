From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 14:07:16 +0200
Subject: [Buildroot] [git commit] picocom: needs MMU
Message-ID: <20140428121300.352FE9C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec5e6bbefe5849de081046e4fcbfec4d31cd584
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/570/57053f429f59cc7c064bb37a1d6d5a635324cd41/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picocom/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/picocom/Config.in b/package/picocom/Config.in
index bd584e2..5a7d583 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PICOCOM
 	bool "picocom"
+	depends on BR2_USE_MMU # fork()
 	help
 	  picocom is a minimal dumb-terminal emulation program. It
 	  is, in principle, very much like minicom, only it's pico
