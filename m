From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 16:01:37 +0200
Subject: [Buildroot] [git commit] package/proxychains-ng: security bump to
	version 4.11
Message-ID: <20170919135519.1812E80525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d71b8978aa24dd80c51af239633b17437140c2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 4.9 fixes CVE-2015-3887:
https://github.com/rofl0r/proxychains-ng/issues/60

Added md5 & sha1 hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proxychains-ng/proxychains-ng.hash | 5 ++++-
 package/proxychains-ng/proxychains-ng.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.hash b/package/proxychains-ng/proxychains-ng.hash
index e2e8c01..7ca4d5e 100644
--- a/package/proxychains-ng/proxychains-ng.hash
+++ b/package/proxychains-ng/proxychains-ng.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/proxychains-ng/files/
+md5 34d840eb184e96bff418201c28a935c5  proxychains-ng-4.11.tar.bz2
+sha1 00bc3dc18f2b638c79112c99f082a7a2878beaad  proxychains-ng-4.11.tar.bz2
 # Locally computed:
-sha256  859a717e18ed88c9291078a6ed8748dfe95c61220993203890fef8a04d28dda5  proxychains-4.6.tar.bz2
+sha256  dcc4149808cd1fb5d9663cc09791f478805816b1f017381f424414c47f6376b6  proxychains-ng-4.11.tar.bz2
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 0d31bce..a9f3fc9 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROXYCHAINS_NG_VERSION = 4.6
-PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
+PROXYCHAINS_NG_VERSION = 4.11
+PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
