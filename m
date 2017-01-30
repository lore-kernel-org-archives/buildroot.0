From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 16:22:03 +0100
Subject: [Buildroot] [git commit] lxc: install also in staging
Message-ID: <20170130152338.6851881FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e528af6428b31c200c8c723467f758254c4cb612
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install also lxc in staging directory, this will be needed for the
incoming integration of lxd package. Moreover, other packages could
find useful to integrate with liblxc instead of using lxc-xxx binaries.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 34a8556..d803916 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -9,6 +9,7 @@ LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
+LXC_INSTALL_STAGING = YES
 # we're patching configure.ac
 LXC_AUTORECONF = YES
 
