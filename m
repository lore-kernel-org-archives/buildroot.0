From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 22:25:17 +0100
Subject: [Buildroot] [git commit] package/nss-mdns: bump to version 0.14.1
Message-ID: <20191202211933.AF6FA83A1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1776d0ea514a20bd0f609045b607abc776a4438
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to https://github.com/lathiat/nss-mdns to retrieve latest
version

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/Config.in     | 2 +-
 package/nss-mdns/nss-mdns.hash | 2 +-
 package/nss-mdns/nss-mdns.mk   | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index ad69e2aa4c..017e800309 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_NSS_MDNS
 	  resolution by common Unix/Linux programs in the ad-hoc
 	  mDNS domain .local.
 
-	  http://0pointer.de/lennart/projects/nss-mdns/
+	  https://github.com/lathiat/nss-mdns
 
 comment "nss-mdns needs a glibc toolchain"
 	depends on BR2_USE_MMU && BR2_PACKAGE_AVAHI_DAEMON
diff --git a/package/nss-mdns/nss-mdns.hash b/package/nss-mdns/nss-mdns.hash
index ac47e33cb4..9bcec08496 100644
--- a/package/nss-mdns/nss-mdns.hash
+++ b/package/nss-mdns/nss-mdns.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d	nss-mdns-0.10.tar.gz
+sha256	a2094101b735cade45048764ea594bdae2bfa9399837f3c852a5b264416e9c8c	nss-mdns-0.14.1.tar.gz
 sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	LICENSE
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 1512ea2e7f..e399da6743 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NSS_MDNS_VERSION = 0.10
-NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
+NSS_MDNS_VERSION = 0.14.1
+NSS_MDNS_SITE = \
+	https://github.com/lathiat/nss-mdns/releases/download/v$(NSS_MDNS_VERSION)
 NSS_MDNS_LICENSE = LGPL-2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
