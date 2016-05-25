From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 07:24:58 +0200
Subject: [Buildroot] [git commit branch/next] Config.in: use better URL for
	GNU mirrors
Message-ID: <20160525053042.119E281D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3999f0ad3c30fba64d0362aa68d34d1a43cfb3df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As explained on http://www.gnu.org/prep/ftp.en.html, the network of
GNU mirrors provide a generic address, http://ftpmirror.gnu.org/,
which automatically redirects to an up-to-date and local mirror. This
allows to greatly speed-up downloads, and also reduces the load on the
main GNU server.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 4b48c00..681c00c 100644
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
