From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 22:07:53 +0100
Subject: [Buildroot] [git commit] package/mke2img: set sparse_super for
	revision 1
Message-ID: <20151229210759.A42A6826F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=225189803d9ecb07aef3f7f016376c7eb00dc44d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sparse_super feature is more efficient in terms of speed and
available space, so set it by default if supported, i.e. for revision 1.

This gives a huge speed gain for large resize2fs operations, especially
for expansion.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mke2img/mke2img | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index d772af5..c2e0d02 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -82,7 +82,7 @@ main() {
 
     # Upgrade to rev1 if needed
     if [ ${rev} -ge 1 ]; then
-        tune2fs_O_opts+=",filetype"
+        tune2fs_O_opts+=",filetype,sparse_super"
     fi
 
     # Add a journal for ext3 and above
