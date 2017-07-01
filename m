From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 14:57:30 +0200
Subject: [Buildroot] [git commit] core: use positive logic for unstripped
	files/dirs
Message-ID: <20170701130455.4A1637FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9b4d1e2ee8ec8d6512895e16cec560be9114f14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index bd8f0d1..86e10bb 100644
--- a/Config.in
+++ b/Config.in
@@ -436,7 +436,7 @@ endchoice
 
 config BR2_STRIP_EXCLUDE_FILES
 	string "executables that should not be stripped"
-	depends on !BR2_STRIP_none
+	depends on BR2_STRIP_strip
 	default ""
 	help
 	  You may specify a space-separated list of binaries and
@@ -444,7 +444,7 @@ config BR2_STRIP_EXCLUDE_FILES
 
 config BR2_STRIP_EXCLUDE_DIRS
 	string "directories that should be skipped when stripping"
-	depends on !BR2_STRIP_none
+	depends on BR2_STRIP_strip
 	default ""
 	help
 	  You may specify a space-separated list of directories that
