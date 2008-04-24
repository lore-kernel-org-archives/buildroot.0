From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 14:57:59 -0400
Subject: [Buildroot] Problem files
Message-ID: <46a136670804241157r1b0d178fi1d81474a38555621@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've noticed a few packages that use the "hackish" method of defining their
build environment by using a shell script instead of pkg-config. These
scripts reside in /usr/bin and are called by the configure script of other
packages that depend on them, the following is a list of the packages I have
found that do this:

cups-config
curl-config
fltk-config
freetype-config
gpg-error-config
ibgcrypt-config
icu-config
libpng12-config
pkg-config
xft-config
xml2-config
xslt-config

I'm looking for suggestions on what could be done to fix them so cross
compiling works. I would prefer to not have to rewrite all of the makefiles
to sed the right paths in. Freetype is the worst offender, it breaks pango
and fontconfig on Ubuntu. And if you build a system for x86, a few packages
will get linked against your build machine libraries instead of the target,
then you will get errors like "can't find libc.so.6" (gtk and glib are the
two I that know of)


John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/55831383/attachment.htm 
