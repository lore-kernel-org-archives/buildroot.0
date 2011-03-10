From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 10 Mar 2011 19:12:41 +0800
Subject: [Buildroot] [PATCH] buildroot:2011.02: Find compiler in
	environement path other than absolute path.
Message-ID: <1299755561-11490-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

In release 2011.02, external compiler is always prefixed by he customer path.
When customer toolchain path is left empty, this patch avoids prefix absolute path.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/Makefile.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ef2c591..745bb23 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -115,7 +115,11 @@ TOOLCHAIN_EXTERNAL_LOCATION=$(TOOLCHAIN_EXTERNAL_DIR)
 else
 TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
+ifneq ($(TOOLCHAIN_EXTERNAL_LOCATION),)
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_LOCATION)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+else
+TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PREFIX)-
+endif
 endif
 
 # Quotes are needed for spaces et al in path components.
-- 
1.7.0.4
