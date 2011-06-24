From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 24 Jun 2011 10:08:49 -0400
Subject: [Buildroot] [PATCH] linux: Change patch matching string to allow
	all names. This allows the use of patches output by git
	format-patch.
Message-ID: <1308924529-32225-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 43ca87b..fbd0fad 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -98,7 +98,7 @@ $(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
 			toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
-			toolchain/patch-kernel.sh $(@D) $$p linux-\*.patch ; \
+			toolchain/patch-kernel.sh $(@D) $$p \*.patch ; \
 		else \
 			toolchain/patch-kernel.sh $(@D) `dirname $$p` `basename $$p` ; \
 		fi \
-- 
1.7.3.4
