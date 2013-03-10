From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 23:13:35 +0100
Subject: [Buildroot] [git commit] flot: add fillbetween plugin
Message-ID: <20130310221310.D7DC59AFAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bcbd68f7d194a6fb29560deafa61fc08ab34eea6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flot plugin for computing bottoms for filled line and bar charts.

[Peter: fixup help text]
Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flot/Config.in |    5 +++++
 package/flot/flot.mk   |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/flot/Config.in b/package/flot/Config.in
index 60534c1..0bd6b14 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -20,6 +20,11 @@ if BR2_PACKAGE_FLOT
 
 comment "flot plugins"
 
+config BR2_PACKAGE_FLOT_FILLBETWEEN
+	bool "fillbetween"
+	help
+	  Flot plugin for computing bottoms for filled line and bar charts
+
 config BR2_PACKAGE_FLOT_NAVIGATE
 	bool "navigate"
 	help
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index f4ba604..41f5a42 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -1,6 +1,7 @@
 FLOT_VERSION = 0.7
 FLOT_SITE = http://flot.googlecode.com/files
 FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
+	$(if $(BR2_PACKAGE_FLOT_FILLBETWEEN),fillbetween) \
 	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
 	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
 	$(if $(BR2_PACKAGE_FLOT_RESIZE),resize) \
