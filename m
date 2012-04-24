From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 00:03:35 +0200
Subject: [Buildroot] [git commit] package: remove unused STRIP_DISCARD_ALL
	variable
Message-ID: <20120424220422.724F296BB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fd085315620ea128379187b4af7ce417d16a18d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 655951e..14a554a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -126,7 +126,6 @@ TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
 ifeq ($(BR2_STRIP_strip),y)
-STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
 STRIP_STRIP_ALL:=--strip-all
 TARGET_STRIP=$(TARGET_CROSS)strip
@@ -134,7 +133,6 @@ STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
-STRIP_DISCARD_ALL:=
 STRIP_STRIP_UNNEEDED:=
 STRIP_STRIP_ALL:=
 TARGET_STRIP=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
