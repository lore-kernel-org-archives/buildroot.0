From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 15:04:32 +0100
Subject: [Buildroot] [git commit] gengetopt: new package
Message-ID: <20150101140644.862CF8080F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dadd8dd0b913f41faf4412dab8100965bb3fc621
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a host only package, which will be needed for janus-gateway.

[Thomas:
  - Improve commit log.
  - Remove target variant of the package, not needed as we don't do
    development on the target.
  - Remove Config.in.host option for the package, there is not really
    a need to select it from menuconfig, it's merely a build
    dependency for another package.
  - Fix format of hash file.
  - Fix format of comment header in .mk file.
  - Use BR2_GNU_MIRROR.
  - License is GPLv3+, not GPLv3.
  - Add 'LICENSE' to the license files, as it indicates that the
    license is GPLv3+.
  - Add an explanation about $(MAKE1) being used.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gengetopt/gengetopt.hash |    2 ++
 package/gengetopt/gengetopt.mk   |   15 +++++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/gengetopt/gengetopt.hash b/package/gengetopt/gengetopt.hash
new file mode 100644
index 0000000..4f411ac
--- /dev/null
+++ b/package/gengetopt/gengetopt.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 30b05a88604d71ef2a42a2ef26cd26df242b41f5b011ad03083143a31d9b01f7 gengetopt-2.22.6.tar.gz
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
new file mode 100644
index 0000000..7477d53
--- /dev/null
+++ b/package/gengetopt/gengetopt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# gengetopt
+#
+################################################################################
+
+GENGETOPT_VERSION = 2.22.6
+GENGETOPT_SITE = $(BR2_GNU_MIRROR)/gengetopt/
+GENGETOPT_LICENSE = GPLv3+
+GENGETOPT_LICENSE_FILES = COPYING LICENSE
+
+# Parallel build broken
+GENGETOPT_MAKE = $(MAKE1)
+
+$(eval $(host-autotools-package))
