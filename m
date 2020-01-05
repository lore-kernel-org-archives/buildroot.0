From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 22:22:19 +0100
Subject: [Buildroot] [git commit] package/runc: security bump to 1.0.0-rc9
Message-ID: <20200105223019.6A96D8EDF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbbf08849b70d68c8afd2b6648e7be6d5575d6cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerability:

- CVE-2019-16884: runc through 1.0.0-rc8, as used in Docker through
  19.03.2-ce and other products, allows AppArmor restriction bypass because
  libcontainer/rootfs_linux.go incorrectly checks mount targets, and thus a
  malicious Docker image can mount over a /proc directory.

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 4f663affc4..3e8eff3cca 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	efe4ff9bbe49b19074346d65c914d809c0a3e90d062ea9619fe240f931f0b700  runc-1.0.0-rc8.tar.gz
+sha256	2ec69c25df9f02c6fd38eb287145f8afba6772f809abe01df4534b5bfd68e8d4  runc-1.0.0-rc9.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index b858742905..acf61ab160 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.0-rc8
+RUNC_VERSION = 1.0.0-rc9
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
