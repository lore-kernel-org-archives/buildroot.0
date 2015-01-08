From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu,  8 Jan 2015 21:31:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: "/bin/bash" =>
	"/usr/bin/env bash" shebang
Message-ID: <1420749079-29099-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For portability. All other Buildroot scripts (i.e. scripts that run on
host) already use the "/usr/bin/env bash" shebang.

This change is needed for NixOS, which lacks a global /bin/bash.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 package/mke2img/mke2img | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 68da6ed..5e2f62f 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # Buildroot wrapper to the collection of ext2/3/4 filesystem tools:
 # - genext2fs, to generate ext2 filesystem images
-- 
2.1.3
