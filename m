From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 16:34:37 +0200
Subject: [Buildroot] [git commit] gdb: enable host-gdb on aarch64
Message-ID: <20151020143646.0970181EC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c436ffbc7efcff1ab96d99b8620c6562cfc1ad0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb has full support for aarch64 since version 7.6,
current minimum is 7.7.1.
Target build was re-enabled over a year ago, but host-gdb was not.

Related commits:
0e49733b306b353aad3a29a2c7a6faf25841ef0b gdb disabled for aarch64
4372449a4f8e16f763c7d5a0c125ca015a7cbef6 target-gdb re-enabled

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b66e742..b65dd52 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,7 +4,7 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
