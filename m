From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 3 Jan 2008 22:45:56 -0200
Subject: [Buildroot] Looking for comments on Libdaemon issues
Message-ID: <d6cda7730801031645v50d45254wc3a3c3f131ee021a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


   I'm always having this same issue with libdaemon for quite
sometime. It stops the build with an error asking for libtoolize
--force --copy. It happens with both svn and the Atmel fork.
   If I cd to the build folder and do the libtoolize by hand then
make, it continues as expected, but it's becoming quite annoying
thing....
   Would it be alright if libdaemon.mk would be changed to:

Index: package/libdaemon/libdaemon.mk
===================================================================
--- package/libdaemon/libdaemon.mk	(revision 20705)
+++ package/libdaemon/libdaemon.mk	(working copy)
@@ -31,7 +31,7 @@
 	touch $@

 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
-	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoreconf)
+	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoreconf &&
libtoolize --force --copy)
 	(cd $(LIBDAEMON_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \

   Or is this A Wrong Thing (tm)? The above change fixes the issues
I'm having, but I'm not sure if it would affect others.
   PS: I'm using gentoo on the host.

Regards,
   Thiago A. Corr?a
