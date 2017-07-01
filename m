From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 14:51:19 +0200
Subject: [Buildroot] [PATCH 1/3] core: use positive logic for unstripped
	files/dirs
In-Reply-To: <cover.1498913468.git.yann.morin.1998@free.fr>
References: <cover.1498913468.git.yann.morin.1998@free.fr>
Message-ID: <9b010a59f3664b80ad8eff168c027fb93bc5bd9b.1498913468.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index bd8f0d1a10..86e10bbe15 100644
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
-- 
2.11.0
