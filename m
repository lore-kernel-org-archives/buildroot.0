From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:44:12 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/runc: security
 bump to version 1.0.0-rc92
Message-ID: <20200915185442.684A68ABA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f95548b49ecd55a9ce85f38500417806bdf0acce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

1.0.0-rc91 fixes a minor security issue:
https://github.com/opencontainers/runc/security/advisories/GHSA-g54h-m393-cpwq

In addition, 1.0.0-rc92 fixes a regression introduced in 1.0.0-rc91.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2462bf1ba5941e5d7981eb792e47ba335aa3f20c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index b895f6fccb..d792947d5f 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	6b44985023347fb9c5a2cc6f761df8c41cc2c84a7a68a6e6acf834dff6653a9a  runc-1.0.0-rc10.tar.gz
+sha256	28378df983a3c586ed3ec8c76a774a9b10f36a0c323590a284b801cce95cc61f  runc-1.0.0-rc92.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 4c2f84ab16..1c2fee067e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.0-rc10
+RUNC_VERSION = 1.0.0-rc92
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
