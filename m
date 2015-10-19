From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 19 Oct 2015 18:38:14 +0200
Subject: [Buildroot] [PATCH 1/1] Use portable shebangs (/bin/bash ->
	/usr/bin/env bash)
Message-ID: <1445272694-26156-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"/usr/bin/env bash" is used everywhere else in host tools. These are the
only remaining offenders.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 board/atmel/flasher.sh        | 2 +-
 board/wandboard/post-image.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index b04b53d..bbdb199 100755
--- a/board/atmel/flasher.sh
+++ b/board/atmel/flasher.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 BUILDIR=$1
 TTY=$2
diff --git a/board/wandboard/post-image.sh b/board/wandboard/post-image.sh
index 7c90271..95cbfa4 100755
--- a/board/wandboard/post-image.sh
+++ b/board/wandboard/post-image.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 GENIMAGE_CFG="board/wandboard/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-- 
2.5.2
