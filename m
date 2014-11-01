From: Karoly Kasza <kaszak@gmail.com>
Date: Sat,  1 Nov 2014 21:54:40 +0100
Subject: [Buildroot] [PATCH v3] xinetd: change download location
Message-ID: <1414875280-57041-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xinetd.org is down, change to github instead.
Hash can not be used, the tarball is generated.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v2 -> v3:
  - use github helper

 package/xinetd/xinetd.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 1fb91b5..92d0d53 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XINETD_VERSION = 2.3.15
-XINETD_SITE = http://www.xinetd.org
+XINETD_VERSION = xinetd-2-3-15
+XINETD_SITE = $(call github,xinetd-org,xinetd,$(XINETD_VERSION))
 XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
-- 
1.7.10.4
