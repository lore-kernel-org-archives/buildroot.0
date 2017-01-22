From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Jan 2017 22:39:56 +0100
Subject: [Buildroot] [PATCH 2/2] runc: security bump to fix CVE-2016-9962
In-Reply-To: <20170122213956.1805-1-peter@korsgaard.com>
References: <20170122213956.1805-1-peter@korsgaard.com>
Message-ID: <20170122213956.1805-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RunC allowed additional container processes via runc exec to be ptraced by
the pid 1 of the container.  This allows the main processes of the
container, if running as root, to gain access to file-descriptors of these
new processes during the initialization and can lead to container escapes or
modification of runC state before the process is fully placed inside the
container.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 5b5400eee..0b6a24ffc 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 638742c48426b9a3281aeb619e27513d972de228bdbd43b478baea99c186d491  runc-v1.0.0-rc2.tar.gz
+sha256 374822cc2895ed3899b7a3a03b566413ea782fccec1307231f27894e9c6d5bea  runc-50a19c6ff828c58e5dab13830bd3dacde268afe5.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 661872c96..95afcaaff 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc2
+RUNC_VERSION = 50a19c6ff828c58e5dab13830bd3dacde268afe5
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
-- 
2.11.0
