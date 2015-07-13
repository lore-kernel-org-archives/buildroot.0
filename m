From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 13 Jul 2015 13:36:28 +0200
Subject: [Buildroot] [PATCH] CHANGES: add release note for the permissions
In-Reply-To: <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1436787388-24414-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the rsync of skeleton or rootfs now changes the permissions of
the copied files and directories, this may break existing setups that
rely on these permissions being kept. So add a release not explaining
how it should be done.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 CHANGES | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3f5162e..1e94929 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2015.08-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	Infrastructure: Buildroot takes better care now of generating
+	predictable permissions in the target filesystem. However,
+	existing permissions on a custom skeleton or rootfs overlay
+	will no longer be preserved. Therefore, it is necessary to
+	add a permission table (BR2_ROOTFS_DEVICE_TABLE) to set
+	the required permissions.
+
 2015.05, Released May 31st, 2015
 
 	Minor fixes.
-- 
2.1.4
