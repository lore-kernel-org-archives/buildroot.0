From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:16:59 +0200
Subject: [Buildroot] [git commit] package/mke2img: check nb_blocks is
	specified
Message-ID: <20170513131741.67AB8827FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48d5bebe76fafdd7cc3a990b1e6e49468397a2cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we do not have autocalculation anymore, the user must specify the
exact number of blocks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mke2img/mke2img | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index b773aa9..758b6de 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -44,6 +44,9 @@ main() {
     if [ -z "${image}" ]; then
         error "you must specify an output image file with '-o'\n"
     fi
+    if [ -z "${nb_blocks}" ]; then
+        error "you must specify the size of the output image with '-b'\n"
+    fi
     case "${gen}:${rev}" in
     2:0|2:1|3:1|4:1)
         ;;
