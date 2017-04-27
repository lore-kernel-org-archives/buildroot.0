From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 14:12:32 +0200
Subject: [Buildroot] [git commit] libnl: add upstream security fix
Message-ID: <20170427121702.8C05F82810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5efbd573c0a4df751e038a927c09af5aac1a233e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2017-0553: An elevation of privilege vulnerability in libnl could enable a
local malicious application to execute arbitrary code within the context of
the Wi-Fi service

https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1511855.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnl/libnl.hash | 1 +
 package/libnl/libnl.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 9761a95..f357927 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,3 @@
 # From https://github.com/thom311/libnl/releases/download/libnl3_2_29/libnl-3.2.29.tar.gz.sha256sum
 sha256	0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922	libnl-3.2.29.tar.gz
+sha256	b7bb929194eefc56c786a7e1ae5176b54713f9013ccec63760f232742ae80361	3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 6de6825..8226f87 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,6 +13,8 @@ LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 # Patching configure.ac
 LIBNL_AUTORECONF = YES
 
+LIBNL_PATCH = https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
+
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
