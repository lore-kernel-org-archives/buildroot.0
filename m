From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Jun 2014 21:12:29 +0200
Subject: [Buildroot] [PATCH 6 of 6 v4] mkpasswd: change version from
 'undefined' to 'buildroot-$(BR2_VERSION)'
In-Reply-To: <patchbomb.1402513943@localhost>
References: <patchbomb.1402513943@localhost>
Message-ID: <56d60e3e11b3e3b0c839.1402513949@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sources of the mkpasswd package are shipped with Buildroot, rather than
downloaded from an external location. As a result, no explicit version is
defined, causing build messages and build directory to show 'undefined' as
version.

This patch sets the version for mkpasswd to 'buildroot-$(BR2_VERSION), which
would for example expand to 'buildroot-2014.05'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v4: no changes
v3: no changes
v2: no changes

 package/mkpasswd/mkpasswd.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff -r 7631eab20c58 -r 56d60e3e11b3 package/mkpasswd/mkpasswd.mk
--- a/package/mkpasswd/mkpasswd.mk	Sun May 11 14:43:08 2014 +0200
+++ b/package/mkpasswd/mkpasswd.mk	Sun May 11 14:48:11 2014 +0200
@@ -10,6 +10,8 @@
 HOST_MKPASSWD_SOURCE =
 HOST_MKPASSWD_LICENSE = GPLv2+
 
+HOST_MKPASSWD_VERSION = buildroot-$(BR2_VERSION)
+
 define HOST_MKPASSWD_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
 		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \
