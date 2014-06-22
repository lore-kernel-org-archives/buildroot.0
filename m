From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 21:53:35 +0200
Subject: [Buildroot] [git commit] knock: fix static build
Message-ID: <20140622195344.AB7C79D063@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b64a06d7b70bd7b160826bf9b97e60e18171913d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pcap-config to determine link dependencies of libpcap.

Fixes:
http://autobuild.buildroot.net/results/1eb/1eb877ebd9469c9261bf114fc7733819ae3fd562/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/knock/knock.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 8d2b41e..682d031 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -10,4 +10,8 @@ KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+KNOCK_CONF_OPT = LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+endif
+
 $(eval $(autotools-package))
