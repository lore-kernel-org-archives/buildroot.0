From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Mon, 21 Jan 2013 19:24:48 +0000
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <87622rd1ex.fsf@dell.be.48ers.dk>
References: <87622rd1ex.fsf@dell.be.48ers.dk>
Message-ID: <1358796288-17403-1-git-send-email-bogdan@nimblex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I adjusted my patch and yes, the correct way is very nice :)
I was at the mountains and I didn't have my computer to send the adjustment earlier.
Thanks for you advice!


Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 package/Config.in       |  1 +
 package/iftop/Config.in | 16 ++++++++++++++++
 package/iftop/iftop.mk  | 15 +++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/iftop/Config.in
 create mode 100644 package/iftop/iftop.mk

diff --git a/package/Config.in b/package/Config.in
index ba03b3c..9e2dd8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -772,6 +772,7 @@ endif
 source "package/bwm-ng/Config.in"
 source "package/cpuload/Config.in"
 source "package/htop/Config.in"
+source "package/iftop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
new file mode 100644
index 0000000..90e36b8
--- /dev/null
+++ b/package/iftop/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IFTOP
+	bool "iftop"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_INET_IPV6
+
+	help
+	  iftop does for network usage what top(1) does for CPU usage.
+	  It listens to network traffic on a named interface and displays
+	  a table of current bandwidth usage by pairs of hosts. Handy for
+	  answering the question "why is our ADSL link so slow?".
+
+	  http://www.ex-parrot.com/pdw/iftop/
+
+comment "iftop requires IPv6 support in toolchain"
+	depends on !BR2_INET_IPV6
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
new file mode 100644
index 0000000..48c9480
--- /dev/null
+++ b/package/iftop/iftop.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# iftop
+#
+#############################################################
+
+IFTOP_VERSION = 1.0pre2
+IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
+
+IFTOP_DEPENDENCIES = ncurses libpcap
+
+IFTOP_LICENSE = GPL
+IFTOP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.12.1
