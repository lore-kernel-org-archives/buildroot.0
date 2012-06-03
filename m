From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Jun 2012 21:20:45 +0200
Subject: [Buildroot] [git commit] package: add ortp
Message-ID: <20120604071301.8F66E96E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc9b0ba064a00e965d2e8ee6aacbf17a89071e15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/ortp/Config.in |    6 ++++++
 package/ortp/ortp.mk   |    5 +++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ca8fc96..3e97ae5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ source "package/libsoup/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/ortp/Config.in"
 source "package/zeromq/Config.in"
 endmenu
 
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
new file mode 100644
index 0000000..39d9c9a
--- /dev/null
+++ b/package/ortp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ORTP
+	bool "oRTP"
+	help
+	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
+
+	  http://www.linphone.org/eng/documentation/dev/ortp.html
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
new file mode 100644
index 0000000..f47af8a
--- /dev/null
+++ b/package/ortp/ortp.mk
@@ -0,0 +1,5 @@
+ORTP_VERSION = 0.20.0
+ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
+ORTP_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
