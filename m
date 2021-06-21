From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:02:27 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/gdb: improve gdb
 version choice comment
Message-ID: <20210621190350.B23C38027C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d20d0591323f813aff0faff89242de70715ebe38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The comment has been introduced by commit [1] where the latest
gdb version has been used when cross-gdb is not enabled.

But since then the gdb package doesn't use the latest gdb version when
cross-gdb is not enabled. It's the "stable" version.

[1] https://git.buildroot.net/buildroot/commit/?id=fda818390b5e6a585608f4523356eafa0c587f53

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4de251ea41d109601ce84317b477a83f52629c15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 07e75b2c0e..21e6b34caa 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -81,7 +81,7 @@ endchoice
 
 endif
 
-# If cross-gdb is not enabled, the latest working version is chosen.
+# If cross-gdb is not enabled, the latest stable version is chosen.
 config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
