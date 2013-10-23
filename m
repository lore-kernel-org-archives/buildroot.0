From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2013 01:43:22 +0200
Subject: [Buildroot] [PATCH] stress: disable documentation
Message-ID: <1382571802-23306-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fails to build with my makeinfo version. Note that the autobuilders don't
see this, probably because they don't have makeinfo installed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stress/stress.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 63efb66..b058031 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -17,7 +17,10 @@ STRESS_AUTORECONF = YES
 #
 # If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
 # --disable-static explicitly to get stress linked dynamically.
+#
+# Also, disable documentation by undefining makeinfo
 STRESS_CONF_OPT = \
-	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
+	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
+	MAKEINFO=:
 
 $(eval $(autotools-package))
-- 
1.8.4.rc3
