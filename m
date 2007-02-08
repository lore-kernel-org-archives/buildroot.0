From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 8 Feb 2007 08:12:46 -0800 (PST)
Subject: [Buildroot] Second Step in allowing Static / shared library choice
Message-ID: <8868429.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The second step is to modify package/Makefile.in with the following patch:
This means in package makefiles we can use $(ENABLE_STATIC_LIBS) etc as a
shortcut to decide if we are configuring in support for static or shared (or
both) libraries.

Cheers
Dan 

@@ -98,6 +99,18 @@
 DISABLE_NLS:=
 else
 DISABLE_NLS:=--disable-nls
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+ENABLE_STATIC_LIBS:=--enable-static
+else
+ENABLE_STATIC_LIBS:=
+endif
+
+ifeq ($(BR2_SHARED_LIBS),y)
+ENABLE_SHARED_LIBS:=--enable-static
+else
+ENABLE_SHARED_LIBS:=
 endif
 
 ifneq ($(BR2_LARGEFILE),y)

This p
-- 
View this message in context: http://www.nabble.com/Second-Step-in-allowing-Static---shared-library-choice-tf3194228.html#a8868429
Sent from the BuildRoot mailing list archive at Nabble.com.
