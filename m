From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 20:44:09 +0200
Subject: [Buildroot] [git commit branch/next] Config.in: Use CDN kernel.org
	mirror
Message-ID: <20160524184438.DD66981DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de76cb7da734dde2204a7ea9ff60e24cbe857ddb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It turned out for quite some time CDN-powered mirror
of kernel.org is available. See this announce:
https://www.kernel.org/introducing-fastly-cdn.html

This change switches to that faster mirror by default.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
[Thomas: tweak the help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 93b4f69..b8e5d18 100644
--- a/Config.in
+++ b/Config.in
@@ -225,10 +225,12 @@ config BR2_BACKUP_SITE
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
-	default "https://www.kernel.org/pub"
+	default "https://cdn.kernel.org/pub"
 	help
-	  kernel.org is mirrored on a number of servers around the world.
-	  The following allows you to select your preferred mirror.
+	  kernel.org is mirrored on a number of servers around the
+	  world.  The following allows you to select your preferred
+	  mirror. By default, a CDN is used, which automatically
+	  redirects to a mirror geographically close to you.
 
 	  Have a look on the kernel.org site for a list of mirrors, then enter
 	  the URL to the base directory.  Examples:
