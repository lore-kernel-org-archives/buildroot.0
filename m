From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 21:02:05 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 3/5] manual: more warnings to not
	use output/target
In-Reply-To: <1354046527-13132-1-git-send-email-arnout@mind.be>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
Message-ID: <1354046527-13132-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/using.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 6e144d0..857aa33 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -84,11 +84,12 @@ This directory contains several subdirectories:
   libraries.
 
 * +target/+ which contains 'almost' the complete root filesystem for
   the target: everything needed is present except the device files in
   +/dev/+ (Buildroot can't create them because Buildroot doesn't run
-  as root and doesn't want to run as root). Therefore, this directory
+  as root and doesn't want to run as root). Also, it doesn't have the correct
+  permissions (e.g. setuid for the busybox binary). Therefore, this directory
   *should not be used on your target*.  Instead, you should use one of
   the images built in the +images/+ directory. If you need an
   extracted image of the root filesystem for booting over NFS, then
   use the tarball image generated in +images/+ and extract it as
   root. Compared to +staging/+, +target/+ contains only the files and
-- 
1.7.10.4
