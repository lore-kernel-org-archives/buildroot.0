From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 22:48:53 +0100
Subject: [Buildroot] [git commit] Fix backup and kernel download url.
Message-ID: <20140222214917.45CC89B2AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a9eb20de817fa64de865ee3b715827d26ebaa23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove duplicated slash from backup and kernel download url,
e.g. http://www.kernel.org/pub//linux/kernel/v3.x/linux-3.13.3.tar.xz

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index bcfefc7..d05f4b1 100644
--- a/Config.in
+++ b/Config.in
@@ -173,7 +173,7 @@ if !BR2_PRIMARY_SITE_ONLY
 
 config BR2_BACKUP_SITE
 	string "Backup download site"
-	default "http://sources.buildroot.net/"
+	default "http://sources.buildroot.net"
 	help
 	  Backup site to download from. If this option is set then buildroot
 	  will fall back to download package sources from here if the
@@ -181,7 +181,7 @@ config BR2_BACKUP_SITE
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
-	default "http://www.kernel.org/pub/"
+	default "http://www.kernel.org/pub"
 	help
 	  kernel.org is mirrored on a number of servers around the world.
 	  The following allows you to select your preferred mirror.
