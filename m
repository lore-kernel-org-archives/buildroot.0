From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  7 Mar 2013 23:04:43 +0100
Subject: [Buildroot] [PATCH 6/6] fs/ext2: remove count- and time-based fsck
In-Reply-To: <cover.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <20da59bb44bf9f9331f343a2c7308b7aaa5cb834.1362693453.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the count- and time-based checks intervals to 0, thus
effectively disabling automatic checks at boot.

(After a suggestion by Arnout.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/ext2/genext2fs.sh |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index c466bc2..e4177ae 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -70,8 +70,9 @@ e2tunefsck() {
     esac
     printf "e2fsck was successfully run on rootfs.ext${GEN}\n"
 
-    # e2fsck will force a UUID, which we do not want
-    tune2fs -U clear "${IMG}"
+    # e2fsck will force a UUID, which we do not want;
+    # remove count- and time-based checks
+    tune2fs -U clear -c 0 -i 0 "${IMG}"
 }
 
 # Check we know what generation to generate
-- 
1.7.2.5
