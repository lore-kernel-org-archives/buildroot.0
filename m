From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 23:25:36 +0100
Subject: [Buildroot] [git commit branch/next] fping: new package
Message-ID: <20131122223850.210919BD9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c2b3e50811ff8f75cb1497b10456a8e6b7ae1f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/fping/Config.in |    8 ++++++++
 package/fping/fping.mk  |   12 ++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1a95b10..f9bd88c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -792,6 +792,7 @@ source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/foomatic-filters/Config.in"
+source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
 source "package/gutenprint/Config.in"
 source "package/heirloom-mailx/Config.in"
diff --git a/package/fping/Config.in b/package/fping/Config.in
new file mode 100644
index 0000000..686102a
--- /dev/null
+++ b/package/fping/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FPING
+	bool "fping"
+	help
+	  fping is a program to send ICMP echo probes to network hosts,
+	  similar to ping, but much better performing when pinging
+	  multiple hosts.
+
+	  http://fping.org/
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
new file mode 100644
index 0000000..580920e
--- /dev/null
+++ b/package/fping/fping.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# fping
+#
+################################################################################
+
+FPING_VERSION = 3.8
+FPING_SITE = http://fping.org/dist
+FPING_LICENSE = BSD-like
+FPING_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
