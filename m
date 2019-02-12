From: Christian Stewart <christian@paral.in>
Date: Tue, 12 Feb 2019 00:38:18 -0800
Subject: [Buildroot] [PATCH 1/1] runc: bump to 6635b4f,
 fixes critical CVE-2019-5736
Message-ID: <20190212083818.20746-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Runc has a bug and related CVE which enables code running in a container to
overwrite the runc binary, taking root control of the host system and escaping
containment. This commit upgrades Runc to fix the vulnerability.

Fixes: CVE-2019-5736
Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 1636e5b8e9..1cd3413e6c 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	a221f8380e7b5806031f54d423af6dde24c305dad49868056cf70e5f5f4ef771  runc-v1.0.0-rc6.tar.gz
+sha256	a960decadf6bd5d3cee1ca7b94455d37cc921c964061428bd9f3dd17a13c8bb3  runc-6635b4f0c6af3810594d2770f662f34ddc15b40d.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 0539661266..60e54ce2bd 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc6
+RUNC_VERSION = 6635b4f0c6af3810594d2770f662f34ddc15b40d
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
-- 
2.19.2
