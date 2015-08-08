From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:01 -0000
Subject: [Buildroot] [git commit branch/next] CHANGES: add release note for
	the permissions
Message-ID: <20150808105630.325917FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=439296501d544251a9a5d9b117ea3d29b7dbe559
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the rsync of skeleton or rootfs now changes the permissions of
the copied files and directories, this may break existing setups that
rely on these permissions being kept. So add a release note explaining
how it should be done.

[Thomas: fixup commit log as suggested by Baruch.]

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

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
