From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:35:08 +0100
Subject: [Buildroot] [git commit] package/mke2img: "/bin/bash" =>
	"/usr/bin/env bash" shebang
Message-ID: <20150108203538.604278083E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e3dcdcdfae9aacf1e4c152680c6a75408731965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For portability. All other Buildroot scripts (i.e. scripts that run on
host) already use the "/usr/bin/env bash" shebang.

This change is needed for NixOS, which lacks a global /bin/bash.

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mke2img/mke2img |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 68da6ed..5e2f62f 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # Buildroot wrapper to the collection of ext2/3/4 filesystem tools:
 # - genext2fs, to generate ext2 filesystem images
