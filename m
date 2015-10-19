From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 22:06:06 +0200
Subject: [Buildroot] [git commit] Use portable shebangs (/bin/bash ->
	/usr/bin/env bash)
Message-ID: <20151019202704.A4F51804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9eedc747ab8ed24b1a57a903fe0dd62aef96af2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"/usr/bin/env bash" is used everywhere else in host tools. These are the
only remaining offenders.

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/atmel/flasher.sh        |    2 +-
 board/wandboard/post-image.sh |    2 +-
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
