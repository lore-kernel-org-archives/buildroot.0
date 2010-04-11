From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:19 +0200
Subject: [Buildroot] [PATCH 23/25] Remove variables useless after
	BR2_PREFER_IMA removal
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2876c46cd40e81e866259b7636cca9a8f4348f8d.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Makefile.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index db1a87a..16451ee 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -40,9 +40,5 @@ endif
 # FIXME -- this is temporary
 OPTIMIZE_FOR_CPU=$(ARCH)
 
-# late binding check to see if the target cc supports -fwhole-program
-CFLAGS_WHOLE_PROGRAM = $(call cc-option,-fwhole-program,)
-CFLAGS_COMBINE = $(call cc-option,-combine,)
-
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-- 
1.6.3.3
