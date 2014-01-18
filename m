From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:41:42 +0100
Subject: [Buildroot] [PATCH v2 6/6] Makefile: export PATH
In-Reply-To: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
References: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390074102-15686-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This can be useful for:
- package using custom build system that are not aware that the host
  tree is in $(O)/host/;
- post-{build,image} scripts, in case some host-tools were specifically
  built to be used by these scripts.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- extend commit message
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index a9178aa..a8e1585 100644
--- a/Makefile
+++ b/Makefile
@@ -332,6 +332,7 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+export PATH:=$(BR2_PATH)
 
 ################################################################################
 #
-- 
1.8.5.3
