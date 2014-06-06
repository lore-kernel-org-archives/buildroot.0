From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 06 Jun 2014 22:13:02 +0200
Subject: [Buildroot] [PATCH 6 of 7 v3] makedevs: change version from
 'undefined' to 'buildroot-$(BR2_VERSION)'
In-Reply-To: <patchbomb.1402085576@localhost>
References: <patchbomb.1402085576@localhost>
Message-ID: <bf59ee5c4a4aae3a54af.1402085582@localhost>
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
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v3: no changes
v2: no changes

 package/makedevs/makedevs.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff -r 640c5d9c5ac1 -r bf59ee5c4a4a package/makedevs/makedevs.mk
--- a/package/makedevs/makedevs.mk	Sun May 11 14:28:02 2014 +0200
+++ b/package/makedevs/makedevs.mk	Sun May 11 14:43:08 2014 +0200
@@ -8,6 +8,8 @@
 MAKEDEVS_SOURCE =
 HOST_MAKEDEVS_SOURCE =
 
+MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
+
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		package/makedevs/makedevs.c -o $(@D)/makedevs
