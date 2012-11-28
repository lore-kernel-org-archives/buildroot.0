From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 17:07:47 -0800
Subject: [Buildroot] [git commit] manual: more warnings to not use
	output/target
Message-ID: <20121128011238.C017297200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13562ddd2ac2f15e14d5f244675bc3ab2bc63fb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/using.txt |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 6e144d0..857aa33 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -86,7 +86,8 @@ This directory contains several subdirectories:
 * +target/+ which contains 'almost' the complete root filesystem for
   the target: everything needed is present except the device files in
   +/dev/+ (Buildroot can't create them because Buildroot doesn't run
-  as root and doesn't want to run as root). Therefore, this directory
+  as root and doesn't want to run as root). Also, it doesn't have the correct
+  permissions (e.g. setuid for the busybox binary). Therefore, this directory
   *should not be used on your target*.  Instead, you should use one of
   the images built in the +images/+ directory. If you need an
   extracted image of the root filesystem for booting over NFS, then
