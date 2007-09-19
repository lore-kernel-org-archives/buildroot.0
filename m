From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Wed, 19 Sep 2007 21:06:54 +0200 (CEST)
Subject: [Buildroot] [patch] here are some more cleanup patches
Message-ID: <0709192052250.18886@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

but libvorbis fails to build:

  In file included from mdct.c:44:
  ../include/vorbis/codec.h:26:21: error: ogg/ogg.h: No such file or
  directory

Can't seem to be able to build ltrace; something to do with configure not
being able to locate gelf.h, but it's there:
staging_dir/usr/include/libelf, as libelf build ok; I get a configure
error:

  checking gelf.h usability... no
  checking gelf.h presence... no
  checking for gelf.h... no
  configure: error: ***** gelf.h not found *****

config.log says in more than one place:

  /usr/include/libelf/gelf.h:49:2: error: #error "GElf is not supported on
    this sysystem."

and bails out further down with:

  configure:3629: checking for gelf.h
  configure:3636: result: no
  configure:3643: error: ***** gelf.h not found *****

ac_cv_header_gelf_h=no may have something to do with it.

Any ideas?


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-2007-09-19.submit.patch
Type: text/x-diff
Size: 21699 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070919/91ad3bcd/attachment-0001.bin 
