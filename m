From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 11:50:00 +0200
Subject: [Buildroot] [git commit] package/nodejs: drop minor version in
	Config.in
Message-ID: <20150706095005.82C028180C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb6254a5aa2e0bf539b74279828c64be6693593b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the minor version from the Kconfig symbol, so we can seamlessly
update the versions without having to handle legacy stuff.

Note: not adding legacy handling, as we haven't had any release with
those symbols yet.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Chris Becker <goabonga@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 580d9a2..5b871ea 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -24,16 +24,16 @@ if BR2_PACKAGE_NODEJS
 
 choice
 	prompt "Node.js version"
-	default BR2_BR2_PACKAGE_NODEJS_0_10_39 if BR2_ARM_CPU_ARMV5
-	default BR2_BR2_PACKAGE_NODEJS_0_12_5
+	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
+	default BR2_BR2_PACKAGE_NODEJS_0_12_X
 	help
 	  Select the version of Node.js you wish to use.
 
-config BR2_BR2_PACKAGE_NODEJS_0_10_39
+config BR2_BR2_PACKAGE_NODEJS_0_10_X
 	bool "v0.10.39"
 
 # V8 included with v0.12.5 requires at least ARMv6
-config BR2_BR2_PACKAGE_NODEJS_0_12_5
+config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "v0.12.5"
 	depends on !BR2_ARM_CPU_ARMV5
 
@@ -41,8 +41,8 @@ endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_39
-	default "0.12.5"	if BR2_BR2_PACKAGE_NODEJS_0_12_5
+	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
+	default "0.12.5"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 
 menu "Module Selection"
 
