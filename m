From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:57:21 +0100
Subject: [Buildroot] [git commit] package/alsa-lib: move comment around,
	to keep proper indentation
Message-ID: <20151228165834.D316B81F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c23dee071c98462da6e65199a9e7c03b34909ee6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Kconfig, when there is an item (like a comment) between a symbol
and its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
menuconfig.

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
