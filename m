From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 12:45:42 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] linux: don't check hashes
 for user-supplied patches
Message-ID: <20190222114347.9F3C98C60B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=323d3e1c2f07c8e84c4386e67fba52f248b6b266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
index bcd5e9cff1..1da4b36c4a 100644
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
