From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:43:28 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libnl: add upstream
	security fix
Message-ID: <20170428125448.5B51580DCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e63c2c35665e17e9b63e53bc6620a20d6e748571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

CVE-2017-0553: An elevation of privilege vulnerability in libnl could enable a
local malicious application to execute arbitrary code within the context of
the Wi-Fi service

https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1511855.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5efbd573c0a4df751e038a927c09af5aac1a233e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnl/libnl.hash | 1 +
 package/libnl/libnl.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index 2f1a3cb..eafba4a 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,2 +1,3 @@
 # From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
 sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
+sha256	b7bb929194eefc56c786a7e1ae5176b54713f9013ccec63760f232742ae80361	3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 85c0db8..af28382 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -11,6 +11,8 @@ LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex
 
+LIBNL_PATCH = https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
+
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
