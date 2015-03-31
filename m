From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:59:58 +0200
Subject: [Buildroot] [git commit] polarssl: switch download URL
Message-ID: <20150331121057.BB9BB81E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5469cb97244d16a3c9973c9d35b09bd19232df84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old wget versions aren't very happy with https moves/alt names hence
complain when trying to download from said sites.
Since polarssl is now mbed tls and everything got renamed switch to the
new URL to avoid this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/polarssl/Config.in   |    2 +-
 package/polarssl/polarssl.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 90788d8..17125a3 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_POLARSSL
 	  use it in your own proprietary applications, you have to
 	  purchase a commercial license.
 
-	  http://polarssl.org/
+	  https://tls.mbed.org/
 
 if BR2_PACKAGE_POLARSSL
 
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 83e1851..ebd0651 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLARSSL_SITE = https://polarssl.org/code/releases
+POLARSSL_SITE = https://tls.mbed.org/code/releases
 POLARSSL_VERSION = 1.2.13
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
