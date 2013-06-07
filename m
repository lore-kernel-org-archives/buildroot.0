From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Fri, 7 Jun 2013 11:12:45 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper: force hash-style to
	'both'
Message-ID: <51B1A40D.8090704@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If ext-toolchain-wrapper was build with gcc that uses hash-style 'gnu' by
default, the resulting binary might be unusable on other systems. The error
in this case is "Floating point exception".
Using hash-style 'both' solves this issue.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
---
 toolchain/toolchain-external/ext-tool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 93b3b15..570c888 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -476,7 +476,7 @@ $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
 			;; \
 		esac; \
 	done ;
-	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s \
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
 
 # 'uclibc' is the target to provide toolchain / staging dir
-- 
1.8.1.2


-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
