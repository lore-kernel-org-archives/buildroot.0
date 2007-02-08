From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 8 Feb 2007 07:18:08 -0800 (PST)
Subject: [Buildroot] First Step in allowing Static / shared library choice
Message-ID: <8867285.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Following on from my question of 'how do we deal with shared and static
builds"
I enclose the following patch.
This is for the top level Config.in
It will appear under Build options
this means that the variables BR2_STATIC_LIBS and BR2_SHARED_LIBS are
available.

Once this patch is in we can start to modify packages to use this
information. (no packages modified yet)

I hope this can get into the mainline without to much difficulty

Cheers
Dan

--- Config.in.orig	2007-02-08 15:08:18.000000000 +0000
+++ Config.in	2007-02-08 15:11:24.000000000 +0000
@@ -361,6 +361,20 @@
 
 	  WARNING: This is highly experimental at the moment.
 
+config BR2_STATIC_LIBS
+	bool "Build static libs for target"
+	default n
+	help
+	    This option when selected will try and build packages with static
libraries.
+	    This will increase code size and is not recommended for embedded
systems.
+
+config BR2_SHARED_LIBS
+	bool "Build shared libs for target"
+	default y
+	help
+	    This option when selected will try and build packages as shared
libraries.
+	    This will increase loading time but minimise size.
+
 
 endmenu
-- 
View this message in context: http://www.nabble.com/First-Step-in-allowing-Static---shared-library-choice-tf3193891.html#a8867285
Sent from the BuildRoot mailing list archive at Nabble.com.
