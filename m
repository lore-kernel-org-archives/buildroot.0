From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 23:53:41 +0200
Subject: [Buildroot] [git commit] udpcast: needs host-m4
Message-ID: <20130605215851.88E9D9A972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf3e314efbf5535dc36ce41fc7370a17bed2707d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/28b/28bc8651ee798af150bba5997b66ec7bb450ecde/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udpcast/udpcast.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 54051b9..a6a2b87 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -8,6 +8,7 @@ UDPCAST_VERSION = 20120424
 UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
+UDPCAST_DEPENDENCIES = host-m4
 
 define UDPCAST_REMOVE_UDP_SENDER
 	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
