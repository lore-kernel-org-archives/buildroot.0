From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:46:51 +0200
Subject: [Buildroot] [git commit] libuecc: bump to v7
Message-ID: <20160402144711.BC8BD807BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f48c5a7e65323a36943182c9ccbcdafab9af4ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From v6 to v7 just few changes were made for performance improvement and
compatibility.

Switched from git download to source tarballs and hashes.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuecc/libuecc.hash | 4 ++++
 package/libuecc/libuecc.mk   | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libuecc/libuecc.hash b/package/libuecc/libuecc.hash
new file mode 100644
index 0000000..67eb5eb
--- /dev/null
+++ b/package/libuecc/libuecc.hash
@@ -0,0 +1,4 @@
+# from https://projects.universe-factory.net/projects/fastd/files
+md5     5cd543cb8e7bce83a22c07a0579c95a1                                  libuecc-7.tar.xz
+# computed locally
+sha256  b94aef08eab5359d0facaa7ead2ce81b193eef0c61379d9835213ebc0a46257a  libuecc-7.tar.xz
diff --git a/package/libuecc/libuecc.mk b/package/libuecc/libuecc.mk
index bddb7d5..87ca2e4 100644
--- a/package/libuecc/libuecc.mk
+++ b/package/libuecc/libuecc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBUECC_VERSION = v6
-LIBUECC_SITE = git://git.universe-factory.net/libuecc
+LIBUECC_VERSION = 7
+LIBUECC_SITE = https://projects.universe-factory.net/attachments/download/85
+LIBUECC_SOURCE = libuecc-$(LIBUECC_VERSION).tar.xz
 LIBUECC_LICENSE = BSD-2c
 LIBUECC_LICENSE_FILES = COPYRIGHT
 LIBUECC_INSTALL_STAGING = YES
