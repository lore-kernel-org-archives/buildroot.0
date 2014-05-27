From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 11:16:13 +0200
Subject: [Buildroot] [git commit] gdb: remove remaining 6.6a reference for
	bfin
Message-ID: <20140527091837.022319CDD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3f18230402224c3f696d7f0336d7066acc2c508
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3e2/3e2b733758651f7a168832de2d3b34afc171609d/

We recently (dfc3cc23af: gdb: switch to 7.x for Blackfin) moved to the
normal 7.x versions for bfin, but Config.in wasn't updated, causing bfin to
still use the old 6.6a variant (but without the uClibc patch) if the
host-gdb isn't selected, breaking the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 4dbc81d..1ba3664 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -40,8 +40,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "6.6a"     if BR2_GDB_VERSION_6_6 || \
-	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "arc-4.8-R3" if BR2_arc
