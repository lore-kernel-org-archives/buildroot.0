From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:41:15 +0100
Subject: [Buildroot] [git commit] gcc: add missing $(Q)
Message-ID: <20130324130049.C39379B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46f37dabc52be03dba56b98d8e0b4ae1d1bc53b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a missing $(Q) in front of a MESSAGE call, which leads to the
message being displayed but also the command that shows the message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index db9715a..1b7f222 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -211,7 +211,7 @@ endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
-	$(call MESSAGE,"Downloading gcc")
+	$(Q)$(call MESSAGE,"Downloading gcc")
 	$(call DOWNLOAD,$(GCC_SITE)/$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
