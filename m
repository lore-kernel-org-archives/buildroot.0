From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Jun 2011 10:59:33 +0200
Subject: [Buildroot] [git commit] bmon: add optional alsa support
Message-ID: <20110617090100.0471A88CAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=85aed3e325e953025426fdde0447359ab7a4c8a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bmon/bmon.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index aa097fb..ef2dcf0 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -14,6 +14,12 @@ else
 BMON_CONF_OPT += --disable-curses
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+BMON_DEPENDENCIES += alsa-lib
+else
+BMON_CONF_OPT += --disable-asound
+endif
+
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 # link dynamically unless explicitly requested otherwise
 BMON_CONF_OPT += --disable-static
-- 
1.7.3.4
