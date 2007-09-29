From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 28 Sep 2007 23:48:28 -0400
Subject: [Buildroot] Quotes needed in package/Makefile.in
Message-ID: <bcba51a0709282048v34a4ce24y4a984468955d54cb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please add quotes in package/Makefile.in, like this:

=====================================
--- package/Makefile.in.orig    2007-09-28 23:46:36.000000000 -0400
+++ package/Makefile.in 2007-09-28 23:45:23.000000000 -0400
@@ -109,7 +109,7 @@
 STRIP_STRIP_ALL:=--strip-all
 REMOVE_SECTION_COMMENT:=--remove-section=.comment
 REMOVE_SECTION_NOTE:=--remove-section=.note
-TARGET_STRIP=$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT)
$(REMOVE_SECTION_NOTE)
+TARGET_STRIP="$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT)
$(REMOVE_SECTION_NOTE)"
 STRIP=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)

=====================================

otherwise --remove-section=.note is treated as a separate command due
to preceding whitespace.

Thank you.
-- 
Dimitry Golubovsky

Anywhere on the Web
