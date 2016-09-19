From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:31:52 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: remove unused
	STRIP_STRIP_ALL variable
Message-ID: <20160919173222.B6B467F905@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5676a2deea896f38123b99781da0a612865adeb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable has been unused for a long time, so we can get rid of its
definition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 83c9a89..b4a4c60 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -203,7 +203,6 @@ TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
-STRIP_STRIP_ALL := --strip-all
 TARGET_STRIP = $(TARGET_CROSS)strip
 STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 endif
