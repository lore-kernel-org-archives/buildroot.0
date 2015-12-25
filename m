From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Dec 2015 18:48:42 +0100
Subject: [Buildroot] [git commit] package/nodejs: correct 0.10.x option name
Message-ID: <20151225174920.6DAC282716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2d166004d8e8bbf41375f4277ea4835168642f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nodejs options incorrectly started BR2_BR2_xxx.  This change corrects
the name for 0.10.x releases to BR2_PACKAGE_NODEJS_0_10_X

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy         | 8 ++++++++
 package/nodejs/Config.in | 6 +++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7e32df8..2628796 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -248,6 +248,14 @@ config BR2_PACKAGE_INFOZIP
 	  to avoid ambiguities with Info-Zip's UnZip which has been added
 	  in the unzip package.
 
+config BR2_BR2_PACKAGE_NODEJS_0_10_X
+	bool "nodejs 0.10.x option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_NODEJS
+	help
+	  nodejs 0.10.x option was named incorrectly and has been renamed
+	  to BR2_PACKAGE_NODEJS_0_10_X.
+
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "nodejs version 0.12.x has been removed"
 	select BR2_LEGACY
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index a8eb6d4..eb3aeec 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -37,12 +37,12 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 choice
 	prompt "Node.js version"
-	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
+	default BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
 	default BR2_PACKAGE_NODEJS_5_X
 	help
 	  Select the version of Node.js you wish to use.
 
-config BR2_BR2_PACKAGE_NODEJS_0_10_X
+config BR2_PACKAGE_NODEJS_0_10_X
 	bool "v0.10.41"
 
 config BR2_PACKAGE_NODEJS_5_X
@@ -59,7 +59,7 @@ endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
+	default "0.10.41"	if BR2_PACKAGE_NODEJS_0_10_X
 	default "5.3.0"		if BR2_PACKAGE_NODEJS_5_X
 
 menu "Module Selection"
