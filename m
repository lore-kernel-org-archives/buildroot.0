From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Feb 2013 21:37:32 +0100
Subject: [Buildroot] [git commit] heirloom-mailx: needs fork()
Message-ID: <20130203203735.DAA3E9A8AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3e7fbd75e49e3368b8c361c45344266ceca5cfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

heirloom-mailx uses fork(), so we can't use it as is on !mmu
platforms.

Fixes:

http://autobuild.buildroot.org/results/c5a8e3a4cbc1e1de985fe3c724b711027865abe7/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/heirloom-mailx/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index 9a871d4..ca83dc3 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx"
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Heirloom mailx (previously known as nail) is a mail user
 	  agent for Unix systems.
