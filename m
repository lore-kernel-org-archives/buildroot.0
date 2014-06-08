From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:53:51 +0200
Subject: [Buildroot] [git commit] sshpass: new package
Message-ID: <20140608155416.952FA9CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffe60b1bfa062ae73f0db65c44ebd1781722cced
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add MMU dependency, fix license to GPLv2+.]

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/sshpass/Config.in  |    9 +++++++++
 package/sshpass/sshpass.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1706197..763f148 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1010,6 +1010,7 @@ source "package/spawn-fcgi/Config.in"
 source "package/spice/Config.in"
 source "package/spice-protocol/Config.in"
 source "package/squid/Config.in"
+source "package/sshpass/Config.in"
 source "package/strongswan/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/sshpass/Config.in b/package/sshpass/Config.in
new file mode 100644
index 0000000..24e4629
--- /dev/null
+++ b/package/sshpass/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SSHPASS
+	bool "sshpass"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Sshpass is a tool for non-interactivly performing
+	  password authentication with SSH's so called
+	  "interactive keyboard password authentication".
+
+	  http://sshpass.sourceforge.net
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
new file mode 100644
index 0000000..7344ca6
--- /dev/null
+++ b/package/sshpass/sshpass.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# sshpass
+#
+################################################################################
+
+SSHPASS_VERSION = 1.05
+SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
+SSHPASS_LICENSE = GPLv2+
+SSHPASS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
