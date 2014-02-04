From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 14:44:48 +0100
Subject: [Buildroot] [git commit] udpcast: drop stat64 handling
Message-ID: <20140204134635.9FD4B9C7BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d254925623a2c16c148fc3c8676d9bade2729349
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udpcast was checking the (non-existing) BR_LARGEFILE variable to know if it
should enable stat64 or not, but the package itself depends on largefile
support and more importantly, configure doesn't look at this variable at
all, so we can just drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udpcast/udpcast.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 8c22130..786a88e 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -6,7 +6,6 @@
 
 UDPCAST_VERSION = 20120424
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
-UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 UDPCAST_DEPENDENCIES = host-m4
 
 define UDPCAST_REMOVE_UDP_SENDER
