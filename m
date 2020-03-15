From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:20:58 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] utils/genrandconfig: drop
 outdated python-nfc check
Message-ID: <20200315100832.B7AE48437B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76b4aedd23b64afa56759cc6d78247aa8274ed76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Commit 9ea528f84ba (package/python-nfc: bump to version 0.13.5) changed the
python-nfc package to download from github, so the package no longer needs
bzr on the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 06417e97e38602c0257b37e93285c0b541ab5aa1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index c221ebd670..42655c10f6 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -210,9 +210,6 @@ def fixup_config(sysinfo, configfile):
         return False
     if "BR2_NEEDS_HOST_JAR=y\n" in configlines and not sysinfo.has("jar"):
         return False
-    # python-nfc needs bzr
-    if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has("bzr"):
-        return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
        BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
