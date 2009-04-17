From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 17 Apr 2009 11:56:04 +0200
Subject: [Buildroot] pkgconfig confusion
Message-ID: <1239962164.6397.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've tried to update to the latest buildroot snapshot today and ran into
a problem with pkg-config:

>>> pkgconfig undefined Extracting
gzip: /home/sven/buildroot-new/dl/pkgconfig-undefined.tar.gz: No such
file or directory
tar: This does not look like a tar archive

So I had a look at package/pkgconfig/pkgconfig.mk and found that it
defines all variables with the PKG_CONFIG prefix instead of using
PKGCONFIG. Changing this seems to fix the problem (see attached diff).
Alternatively one could rename pkgconfig/pkgconfig.mk to
pkg-config/pkg-config.mk.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: pkgconfig.diff
Type: text/x-patch
Size: 3283 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090417/a1823cac/attachment.bin>
