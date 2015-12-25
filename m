From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:30 +0100
Subject: [Buildroot] [PATCH 01/84 RFC] package/alsa-lib: move comment around,
	to keep proper indentation
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <3b4b14770a19221b0c0c8a40d216839ed14b6956.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Kconfig, when there is an item (lie a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/alsa-lib/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index a732c08..ebca265 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -1,3 +1,6 @@
+comment "alsa-lib needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
 	# Temporary until
@@ -15,9 +18,6 @@ config BR2_PACKAGE_ALSA_LIB
 
 	  http://www.alsa-project.org/
 
-comment "alsa-lib needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_ALSA_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PYTHON
-- 
1.9.1
