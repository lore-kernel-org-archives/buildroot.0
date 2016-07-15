From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 20:32:48 +0200
Subject: [Buildroot] [git commit] libgudev: remove incorrect Config.in help
	text information
Message-ID: <20160715183413.A9D2782258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d925b39a4082a17cd8c7711eb942488da66ec33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgudev indeed used to be provided directly by eudev, but it's no
longer the case since eudev 3.1.3, and this has been already taken
into account in Buildroot in commit
6cfa5de33e71b46e9ae668550dc77aacabbde663. We simply forgot to update
the comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgudev/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
index ecaacf5..21606ac 100644
--- a/package/libgudev/Config.in
+++ b/package/libgudev/Config.in
@@ -11,9 +11,6 @@ config BR2_PACKAGE_LIBGUDEV
 	  It's now a project on its own. Required for building some
 	  programs that use udev, when using systemd.
 
-	  When systemd is not used, libgudev is directly provided by
-	  eudev.
-
 	  https://wiki.gnome.org/Projects/libgudev
 
 comment "libgudev needs udev /dev handling and a toolchain w/ wchar, threads"
