From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:23 +0100
Subject: [Buildroot] [RFC v1 14/14] makedevs: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nothing needs to be done, the source is already directly taken from
package/makedevs/, so it just works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/makedevs/makedevs.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 5e984c6..1e28ff7 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -8,6 +8,8 @@
 MAKEDEVS_SOURCE =
 HOST_MAKEDEVS_SOURCE =
 
+MAKEDEVS_SUPPORTS_OUT_OF_TREE = YES
+
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		package/makedevs/makedevs.c -o $(@D)/makedevs
-- 
1.7.9.5
