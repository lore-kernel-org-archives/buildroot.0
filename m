From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 20:01:04 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/runc: security
 bump to 1.0.0-rc9
Message-ID: <20200110193543.BEC2D88770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1ff67df1cd383372a207a3cd14649bb2243b06b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerability:

- CVE-2019-16884: runc through 1.0.0-rc8, as used in Docker through
  19.03.2-ce and other products, allows AppArmor restriction bypass because
  libcontainer/rootfs_linux.go incorrectly checks mount targets, and thus a
  malicious Docker image can mount over a /proc directory.

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbbf08849b70d68c8afd2b6648e7be6d5575d6cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 969bb0bfb3..3e8eff3cca 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	efe4ff9bbe49b19074346d65c914d809c0a3e90d062ea9619fe240f931f0b700  runc-v1.0.0-rc8.tar.gz
+sha256	2ec69c25df9f02c6fd38eb287145f8afba6772f809abe01df4534b5bfd68e8d4  runc-1.0.0-rc9.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 55097e5a17..acf61ab160 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc8
-RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
+RUNC_VERSION = 1.0.0-rc9
+RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
