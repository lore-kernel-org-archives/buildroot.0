From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 30 Jan 2014 21:38:53 +0100
Subject: [Buildroot] [PATCH v3 6/6] Makefile: export PATH
In-Reply-To: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391114333-28001-7-git-send-email-s.martin49@gmail.com>
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

Note that, this patch only exports the PATH variables; cleaning up
all the explicit PATH declarations leading some commands could be done
in a followup patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
- rebase
- extend commit log

changes v1 -> v2:
- rebase
- extend commit message
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5e8cfd8..fa33bc0 100644
--- a/Makefile
+++ b/Makefile
@@ -333,6 +333,7 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+export PATH:=$(BR2_PATH)
 
 ################################################################################
 #
-- 
1.8.5.3
