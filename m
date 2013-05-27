From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 May 2013 13:10:26 +0200
Subject: [Buildroot] [git commit branch/next] dropbear: factorize the
	'depends on BR2_PACKAGE_DROPBEAR'
Message-ID: <20130527221105.0221E9A5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5ee03b252906f4a3533566dad170a16d9d6125f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enclose all dropbear sub-options into a 'if BR2_PACKAGE_DROPBEAR'
... 'endif' block rather than having 'depends on BR2_PACKAGE_DROPBEAR'
for each option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 0903ad1..68c3b71 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_DROPBEAR
 
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
 
+if BR2_PACKAGE_DROPBEAR
+
 config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	bool "disable reverse DNS lookups"
-	depends on BR2_PACKAGE_DROPBEAR
 	help
 	  Disable reverse DNS lookups on connection. This can be handy
 	  on systems without working DNS, as connections otherwise
@@ -17,7 +18,6 @@ config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 config BR2_PACKAGE_DROPBEAR_SMALL
 	bool "optimize for size"
 	default y
-	depends on BR2_PACKAGE_DROPBEAR
 	help
 	  Compile dropbear for the smallest possible binary size.
 
@@ -26,14 +26,14 @@ config BR2_PACKAGE_DROPBEAR_SMALL
 
 config BR2_PACKAGE_DROPBEAR_WTMP
 	bool "log dropbear access to wtmp"
-	depends on BR2_PACKAGE_DROPBEAR
 	help
 	  Enable logging of dropbear access to wtmp. Notice that
 	  Buildroot does not generate wtmp by default.
 
 config BR2_PACKAGE_DROPBEAR_LASTLOG
 	bool "log dropbear access to lastlog"
-	depends on BR2_PACKAGE_DROPBEAR
 	help
 	  Enable logging of dropbear access to lastlog. Notice that
 	  Buildroot does not generate lastlog by default.
+
+endif
