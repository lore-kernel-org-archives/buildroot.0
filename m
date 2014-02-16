From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 14:58:33 +0100
Subject: [Buildroot] [PATCH v4 7/7] Makefile: export PATH
In-Reply-To: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392559113-5215-8-git-send-email-s.martin49@gmail.com>
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
changes v3 -> v4:
- rebase
- rename BR2_PATH -> BR_PATH

changes v2 -> v3:
- rebase
- extend commit loghanges v2 -> v3:

changes v1 -> v2:
- extend commit message
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index bb5b38e..ca2d721 100644
--- a/Makefile
+++ b/Makefile
@@ -353,6 +353,7 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+export PATH:=$(BR_PATH)
 
 ################################################################################
 #
-- 
1.8.5.4
