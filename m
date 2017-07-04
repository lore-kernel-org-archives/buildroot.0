From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:47:07 +0200
Subject: [Buildroot] [git commit] fs/ext2: always pass the label option
Message-ID: <20170704064358.3156B81ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64cfa50789dada9469debc3cc85252fd467e81b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... since passing an empty string is equivalent to not setting a label.

And fix the syntax highlighting in some editors...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/ext2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 3fc12d7..6a35b33 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -19,9 +19,9 @@ endif
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
-ifneq ($(EXT2_LABEL),)
+#" Syntax highlighting... :-/ )
+
 EXT2_OPTS += -l "$(EXT2_LABEL)"
-endif
 
 ROOTFS_EXT2_DEPENDENCIES = host-mke2img
 
