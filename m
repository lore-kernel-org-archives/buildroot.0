From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] tcpreplay: remove --program-prefix
Message-ID: <20110912052636.152A88D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa6e5aed3a702f47221e4614be38e4376e240343
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpreplay/tcpreplay.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f82867c..296f4eb 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -7,7 +7,7 @@
 TCPREPLAY_VERSION = 3.4.3
 TCPREPLAY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/tcpreplay
 TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
-TCPREPLAY_CONF_OPT = --program-prefix="" --with-libpcap=$(STAGING_DIR)/usr
+TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 
 TCPREPLAY_DEPENDENCIES = uclibc libpcap
 
-- 
1.7.3.4
