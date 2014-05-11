From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 11 May 2014 17:38:50 +0200
Subject: [Buildroot] [PATCH 6 of 7] makedevs: change version from
 'undefined' to 'buildroot-$(BR2_VERSION)'
In-Reply-To: <patchbomb.1399822724@argentina>
References: <patchbomb.1399822724@argentina>
Message-ID: <7b8eb2bf5c64030a872b.1399822730@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sources of the makedevs package are shipped with Buildroot, rather than
downloaded from an external location. As a result, no explicit version is
defined, causing build messages and build directory to show 'undefined' as
version.

This patch sets the version for makedevs to 'buildroot-$(BR2_VERSION), which
would for example expand to 'buildroot-2014.05'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/makedevs/makedevs.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -8,6 +8,8 @@
 MAKEDEVS_SOURCE =
 HOST_MAKEDEVS_SOURCE =
 
+MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
+
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		package/makedevs/makedevs.c -o $(@D)/makedevs
