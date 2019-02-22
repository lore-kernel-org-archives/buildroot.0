From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 12:45:36 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] linux: don't check hashes
 for user-supplied patches
Message-ID: <20190222114824.2E5897FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8373b57bbb8b96e7708daee9f0d3abb22fdc71a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

We have virtually no way to know the hashes for user-supplied patches,
so we should just ignore them.

Reported-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ae8dab9e91055b6f674b0287bcb8b1aa90d16e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index ce0b371734..b548bed1a5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,6 +55,9 @@ endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
+# We have no way to know the hashes for user-supplied patches.
+BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
+
 # We rely on the generic package infrastructure to download and apply
 # remote patches (downloaded from ftp, http or https). For local
 # patches, we can't rely on that infrastructure, because there might
