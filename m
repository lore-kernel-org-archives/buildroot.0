From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 23:06:09 +0200
Subject: [Buildroot] [git commit] package/mono: bump to version 6.0.0.313
Message-ID: <20190801210326.B292C81253@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74d9e5d9b8d0fff633463aaf9a41533469822ed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps mono to version 6.0.0.313 and it's related dependency
monolite to version d0aa6798-834d-11e9-b38a-3b0d70487d01.

The hash of the mono license file has changed, with the following
modification:

-* mcs/nunit24: MS-PL
-

However, this modification is in the "Build Time Code" section, which
describes the license of the parts of the code used only at build
time, which we don't document in the <pkg>_LICENSE
variable. Therefore, no relevant licensing change has occured from the
point of view of <pkg>_LICENSE.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Thomas: update the hash of the license file, and add a corresponding
explanation in the commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/mono.hash         | 4 ++--
 package/mono/mono.mk           | 4 ++--
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index b174f6c51e..6fcf26beae 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 5e829e143a0180dc1f1129333b8370442c2ada91b6cc91940d4d096278e73797  mono-5.20.1.27.tar.bz2
-sha256 3b40a54878b5ac2767a764bd082f8772ab27c03b9da9c7328c4c4935725556f7  LICENSE
+sha256 a946e91d7da3f90b5e7cbbdf27adfa2f57ddb09b199dfc4d6d3bc05eb0690c50  mono-6.0.0.313.tar.xz
+sha256 923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index bb482a6d5f..96b9c63689 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MONO_VERSION = 5.20.1.27
+MONO_VERSION = 6.0.0.313
 MONO_SITE = http://download.mono-project.com/sources/mono
-MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
+MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
 MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 486454eba5..1fc0d758cc 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 0694caa24daef80b51addd1e1f5c8a117712c0e5c16e2a1e122e3c015ebd5bba  monolite-linux-B886E13F-6276-4BE5-85F8-C6BF5EDBD200-latest.tar.gz
+sha256 21f0dada9f866e8e90c4884cef08d738f9addbe99b66a4b0d442f25ea0841abe  monolite-linux-d0aa6798-834d-11e9-b38a-3b0d70487d01-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 874b24388d..262ed06c4d 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = B886E13F-6276-4BE5-85F8-C6BF5EDBD200
+MONOLITE_VERSION = d0aa6798-834d-11e9-b38a-3b0d70487d01
 MONOLITE_SITE = http://download.mono-project.com/monolite
 MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
