From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:02:51 +0100
Subject: [Buildroot] [git commit] sstrip: fix source svn repository url
Message-ID: <20141124210319.5991D7FEBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f538ec07c67e63173240eafee51b9877c317570
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the svn repository url was changed the command "make
sstrip-source" gives this error:

svn: E000101: Unable to connect to a repository at URL 'svn://dev.openwrt.org/openwrt/trunk/tools/sstrip'
svn: E000101: Can't connect to host 'dev.openwrt.org': Network is unreachable

To fix this error use the correct url "svn://svn.openwrt.org/openwrt".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sstrip/sstrip.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index deab010..fe57b3c 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
+SSTRIP_SITE = svn://svn.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
 HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
