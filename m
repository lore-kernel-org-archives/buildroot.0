From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:16:09 +0100
Subject: [Buildroot] [git commit] xinetd: change download location
Message-ID: <20141101221617.DB6F5B2BE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c79e80b3117dead27e066c93e24bd818524849d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xinetd.org is down, change to github instead.
Hash can not be used, the tarball is generated.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xinetd/xinetd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
