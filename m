From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 20:48:26 +0200
Subject: [Buildroot] [PATCH] Config.in: use better URL for GNU mirrors
Message-ID: <1464115706-29940-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As explained on http://www.gnu.org/prep/ftp.en.html, the network of
GNU mirrors provide a generic address, http://ftpmirror.gnu.org/,
which automatically redirects to an up-to-date and local mirror. This
allows to greatly speed-up downloads, and also reduces the load on the
main GNU server.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index b8e5d18..6f5003c 100644
--- a/Config.in
+++ b/Config.in
@@ -240,10 +240,12 @@ config BR2_KERNEL_MIRROR
 
 config BR2_GNU_MIRROR
 	string "GNU Software mirror"
-	default "http://ftp.gnu.org/pub/gnu"
+	default "http://ftpmirror.gnu.org"
 	help
-	  GNU has multiple software mirrors scattered around the world.
-	  The following allows you to select your preferred mirror.
+	  GNU has multiple software mirrors scattered around the
+	  world.  The following allows you to select your preferred
+	  mirror. By default, a generic address is used, which
+	  automatically selects an up-to-date and local mirror.
 
 	  Have a look on the gnu.org site for a list of mirrors, then enter
 	  the URL to the base directory.  Examples:
-- 
2.7.4
