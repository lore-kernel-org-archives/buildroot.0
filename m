From: Julien Letessier <julien.letessier@technosens.fr>
Date: Thu, 14 Jun 2007 17:08:09 +0200
Subject: [Buildroot] Easy packaging - Makefile.autotools.in with extra make
	magic
Message-ID: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I've been working on an upgrade to Benjamin's buildroot makefile for
GNU autotools-compliant packages.
Package makefiles themselves can now be even simpler (see example at
end of email). I also addressed a few shortcomings:
- packages aren't re-downloaded at every build.
- packages can have archives with nonstandard names (e.g. "tcl8.4.15")
- human-writable are provided (like "foo-extract", "foo-configure", etc.)
- packages which don't [totally] use the autotools can from this
makefile by overriding some targets.
- autoreconf(1) is supported, e.g. when configure scripts are broken
and  configure.ac's have to be patched
- libtool 'foo.la' files are properly patched once installed in the
staging directory
- the makefile is documented ;)

For the alsa-lib examples, the makefile becomes:

> alsa-lib_VERSION = 1.0.14
> alsa-lib_SITE = ftp://ftp.alsa-project.org/pub/lib
> alsa-lib_SOURCE = alsa-lib-$(alsa-lib_VERSION).tar.bz2
> $(eval $(call AUTOTARGETS,alsa-lib))

Attachements:
- autotools2.patch (Makefile.autools.in and replace.sh)
- apr.patch (apache portable runtime package)
- alsa-lib.patch (alsa libraries)

Apply these with "patch -p0"

Benjamin, please give me your opinion about this!

Cheers,
-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: autotools2.patch
Type: application/octet-stream
Size: 11852 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070614/96e2f3b8/attachment-0003.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa.patch
Type: application/octet-stream
Size: 555 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070614/96e2f3b8/attachment-0004.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: apr.patch
Type: application/octet-stream
Size: 5208 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070614/96e2f3b8/attachment-0005.obj 
