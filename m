From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:50:29 +0100
Subject: [Buildroot] [git commit] mpdecimal: bump to 2.4.1 and add hash file
Message-ID: <20150103205138.7A71380403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7759643f7878d25284cc5996cbd12d011d75c95c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping mpdecimal to 2.4.1 is necessary to make the Python 3 'decimal'
module to build properly, since Python 3.4.2. Thanks to Samuel Martin
for the investigation!

Fixes:

  http://autobuild.buildroot.org/results/c9b/c9b6dd19f16a56a16ef441d5b303badab9720bd7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpdecimal/mpdecimal.hash |    2 ++
 package/mpdecimal/mpdecimal.mk   |    8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
new file mode 100644
index 0000000..249d56c
--- /dev/null
+++ b/package/mpdecimal/mpdecimal.hash
@@ -0,0 +1,2 @@
+# From http://code.activestate.com/lists/python-dev/132315/
+sha256 da74d3cfab559971a4fbd4fb506e1b4498636eb77d0fd09e44f8e546d18ac068 mpdecimal_2.4.1.orig.tar.gz
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 8257c8d..060750c 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.4.0
+# Official site currently down
+# MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
+
+MPDECIMAL_SITE = https://launchpad.net/ubuntu/+archive/primary/+files/
+MPDECIMAL_VERSION = 2.4.1
+MPDECIMAL_SOURCE = mpdecimal_$(MPDECIMAL_VERSION).orig.tar.gz
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2c
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
