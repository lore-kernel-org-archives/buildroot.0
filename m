From: Daniel Frey <dmfrey+linux@gmail.com>
Date: Mon, 27 Aug 2007 20:48:57 -0400
Subject: [Buildroot] Make wants to read local libraries instead of buildroot
	libraries
Message-ID: <b6838d3a0708271748k6a7757b4u79c1beb62022fa6e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have been struggling with resolving dependencies in my buildroot project.
For libraries that have already been pre-configured in the package
directory, I have no issue with.  For something new, libvorbis (requires
libogg), i have modified libogg or xml2 make files, but the linker still
wants to look on the local filesystem version of libogg (usr/lib/libogg.a),
instead of $(TARGET_DIR)/usr/lib, even when $(TARGET_DIR)/usr/lib appears
ahead of /usr/lib/libogg.a.  ($(TARGET_DIR) is expanded out).  My quess is
that libogg.explicitly defines a file, whereas the $(TARGET_DIR) only
specifies a path, but I could be wrong.

I guess what I am looking for is the best way to construct my makefiles so
that they are always working out of the relative buildroot directories
instead of looking to my local filesystem.  I am including my libvorbis.mk

Thanks for any help.
Dan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070827/f8b97902/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libvorbis.mk
Type: application/octet-stream
Size: 2421 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070827/f8b97902/attachment.obj 
