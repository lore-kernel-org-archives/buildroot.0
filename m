From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Sep 2013 23:32:08 +0200
Subject: [Buildroot] [git commit] Config.in: Fixup after BR2_ELF2FLT got
	renamed to BR2_PACKAGE_HOST_ELF2FLT
Message-ID: <20130909213604.26A289A530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f2bf30e1e3fd02230cae39dbfeba423adedbb25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_ELF2FLT option has been renamed to BR2_PACKAGE_HOST_ELF2FLT, thus
use the new name to fix dependency.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index cb246a4..65c29b4 100644
--- a/Config.in
+++ b/Config.in
@@ -286,7 +286,7 @@ choice
 
 config BR2_STRIP_strip
 	bool "strip"
-	depends on !BR2_ELF2FLT
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to
@@ -297,7 +297,7 @@ config BR2_STRIP_strip
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_ELF2FLT
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the 'sstrip' command, which strips a little
