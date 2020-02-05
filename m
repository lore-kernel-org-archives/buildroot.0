From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:40:34 +0100
Subject: [Buildroot] [git commit] package/runc: security bump to version
 1.0.0-rc10
Message-ID: <20200205152933.A3D898CA24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1673d06eb8f7c08d5dbb3e3229f6e134b4c6438b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerability:

- CVE-2019-19921: runc volume mount race condition with shared mounts

For details see the announcement:
https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 3e8eff3cca..b895f6fccb 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	2ec69c25df9f02c6fd38eb287145f8afba6772f809abe01df4534b5bfd68e8d4  runc-1.0.0-rc9.tar.gz
+sha256	6b44985023347fb9c5a2cc6f761df8c41cc2c84a7a68a6e6acf834dff6653a9a  runc-1.0.0-rc10.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index acf61ab160..4c2f84ab16 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.0-rc9
+RUNC_VERSION = 1.0.0-rc10
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
