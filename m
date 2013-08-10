From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 19:20:01 +0200
Subject: [Buildroot] [git commit] legacy: add a legacy option for
	BR2_ARM_OABI
Message-ID: <20130810172055.CFCE59B2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f3078b1cccdc0b60e6eac616c25af7957246694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Arnout noted, we removed the BR2_ARM_OABI option without adding the
corresponding option in Config.in.legacy, so users upgrading to
Buildroot 2013.08 with an OABI configuration would get migrated
automatically to EABI without any warning.

This commit introduces such a legacy option, so that such users would
be explicitly warned about the removal of OABI support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b92b656..763f16c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -47,6 +47,17 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2013.08"
 
+config BR2_ARM_OABI
+	bool "ARM OABI support has been removed"
+	select BR2_LEGACY
+	help
+	  The support for the ARM OABI was deprecated since a while,
+	  and has been removed completely from Buildroot. It is also
+	  deprecated in upstream gcc, since gcc 4.7. People should
+	  switch to EABI instead, which should not be a problem as
+	  long as you don't have pre-built OABI binaries in your
+	  system that you can't recompile.
+
 config BR2_PACKAGE_DOSFSTOOLS_DOSFSCK
 	bool "dosfstools dosfsck renamed to fsck.fat"
 	select BR2_LEGACY
