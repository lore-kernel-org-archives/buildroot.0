From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] cramfs: add explicit dependencies for host
	variant
Message-ID: <20160703064348.90D067FE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e712ffc0f60185b5699a073e9f6284c91d97026c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cramfs/cramfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 72860b6..3cbe274 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -10,6 +10,7 @@ CRAMFS_LICENSE = GPLv2+
 CRAMFS_LICENSE_FILES = COPYING
 
 CRAMFS_DEPENDENCIES = zlib
+HOST_CRAMFS_DEPENDENCIES = host-zlib
 
 define CRAMFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
