From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:37 +0200
Subject: [Buildroot] [PATCH 2/9] package/mke2img: check nb_blocks is
	specified
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <aaa50531bc8d795818d2c4aa8955ad366342e0e4.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we do not have autocalculation anymore, the user must specify the
exact number of blocks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mke2img/mke2img | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index b773aa99db..758b6dee68 100755
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
-- 
2.11.0
