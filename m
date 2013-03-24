From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:42:01 +0100
Subject: [Buildroot] [git commit] uClibc: add missing $(Q)
Message-ID: <20130324130050.5DB359B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69c50c5945c08d7777cc2a36b6acf9c0cc4d8be2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a missing $(Q) in front of a MESSAGE call, which leads to the
message being displayed but also the command that shows the message.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 1b49a8d..e8b2bb4 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -62,7 +62,7 @@ UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
 endif
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
-	$(call MESSAGE,"Downloading uClibc")
+	$(Q)$(call MESSAGE,"Downloading uClibc")
 	$(call DOWNLOAD,$(UCLIBC_SITE)/$(UCLIBC_SOURCE))
 
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
