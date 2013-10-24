From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2013 08:39:28 +0200
Subject: [Buildroot] [git commit] stress: disable documentation
Message-ID: <20131024064830.0887999B2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc7a9bb9f7e0ac096d79c47e9240c2eb7b08dce9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It fails to build with my makeinfo version. Note that the autobuilders don't
see this, probably because they don't have makeinfo installed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress/stress.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
