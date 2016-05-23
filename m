From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 23 May 2016 18:36:53 +0300
Subject: [Buildroot] [PATCH] Config.in: Use CDN kernel.org mirror
Message-ID: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It turned out for quite some time CDN-powered mirror
of kernel.org is available. See this announce:
https://www.kernel.org/introducing-fastly-cdn.html

This change switches to that faster mirror by default.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 93b4f69..71f0161 100644
--- a/Config.in
+++ b/Config.in
@@ -225,7 +225,7 @@ config BR2_BACKUP_SITE
 
 config BR2_KERNEL_MIRROR
 	string "Kernel.org mirror"
-	default "https://www.kernel.org/pub"
+	default "https://cdn.kernel.org/pub"
 	help
 	  kernel.org is mirrored on a number of servers around the world.
 	  The following allows you to select your preferred mirror.
@@ -236,6 +236,9 @@ config BR2_KERNEL_MIRROR
 	     http://www.XX.kernel.org/pub (XX = country code)
 	     http://mirror.aarnet.edu.au/pub/ftp.kernel.org
 
+	  Now when kernel.org is mirrored by CDN as well we'll be using
+	  it by default to speed-up downloads all over the world.
+
 config BR2_GNU_MIRROR
 	string "GNU Software mirror"
 	default "http://ftp.gnu.org/pub/gnu"
-- 
2.5.5
