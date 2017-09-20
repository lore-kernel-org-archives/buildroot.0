From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:20:48 +0200
Subject: [Buildroot] [git commit] augeas: security bump to version 1.8.1
Message-ID: <20170920171430.DB4657FC8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74ac045c80893177fc7a8b3672245bb9ab132773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-7555 - Augeas versions up to and including 1.8.0 are
vulnerable to heap-based buffer overflow due to improper handling of escaped
strings.  Attacker could send crafted strings that would cause the
application using augeas to copy past the end of a buffer, leading to a
crash or possible code execution.

[Peter: extend description]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/augeas/augeas.hash | 2 +-
 package/augeas/augeas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index 797bddb..e044ff4 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  515ce904138d99ff51d45ba7ed0d809bdee6c42d3bc538c8c820e010392d4cc5  augeas-1.8.0.tar.gz
+sha256  65cf75b5a573fee2a5c6c6e3c95cad05f0101e70d3f9db10d53f6cc5b11bc9f9  augeas-1.8.1.tar.gz
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index 1c1461e..20d09eb 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.8.0
+AUGEAS_VERSION = 1.8.1
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
