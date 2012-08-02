From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:33 -0000
Subject: [Buildroot] [git commit branch/next] tcpreplay: cleanup
Message-ID: <20120802195246.093168C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2ddfdb11a2c28c511a2a4d5bf0060217c93d140
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop unneeded uclibc dependency and autoreconf as patch changes
configure.ac.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpreplay/tcpreplay.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 3a526a7..72abade 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -8,8 +8,8 @@ TCPREPLAY_VERSION = 3.4.3
 TCPREPLAY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/tcpreplay
 TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
 TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
-
-TCPREPLAY_DEPENDENCIES = uclibc libpcap
+TCPREPLAY_AUTORECONF = YES
+TCPREPLAY_DEPENDENCIES = libpcap
 
 $(eval $(call AUTOTARGETS))
 
