From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Mar 2020 23:59:20 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: drop outdated python-nfc
 check
Message-ID: <20200303225920.23025-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 9ea528f84ba (package/python-nfc: bump to version 0.13.5) changed the
python-nfc package to download from github, so the package no longer needs
bzr on the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index c79360be89..63ff32cbfb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -206,9 +206,6 @@ def fixup_config(sysinfo, configfile):
 
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
         return False
-    # python-nfc needs bzr
-    if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has("bzr"):
-        return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
        BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-- 
2.20.1
