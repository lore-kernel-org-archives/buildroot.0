From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  3 Jul 2017 17:51:49 +0200
Subject: [Buildroot] [PATCH v2 1/6] fs/ext2: always pass the label option
In-Reply-To: <20170703155154.24104-1-s.martin49@gmail.com>
References: <20170703155154.24104-1-s.martin49@gmail.com>
Message-ID: <20170703155154.24104-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... since passing an empty string is equivalent to not setting a label.

And fix the syntax highlighting in some editors...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- rebase
---
 fs/ext2/ext2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 9d3e8fd666..277e696290 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -20,9 +20,9 @@ endif
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
-ifneq ($(EXT2_LABEL),)
+#" Syntax highlighting... :-/ )
+
 EXT2_OPTS += -l "$(EXT2_LABEL)"
-endif
 
 ROOTFS_EXT2_DEPENDENCIES = host-mke2img
 
-- 
2.13.2
