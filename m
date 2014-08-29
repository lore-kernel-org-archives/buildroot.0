From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 09:59:32 +0200
Subject: [Buildroot] [git commit] exim: requires thread support
Message-ID: <20140829080058.A95919D588@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1ef53ed7e3d9a2369eac11161cc8179d3081f71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/98a1acb58665e6cd2df354fc63afef1d4606c6e0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index bd4ef1f..230ac86 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -1,6 +1,10 @@
+comment "exim needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_EXIM
 	bool "exim"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_BERKELEYDB
 	help
