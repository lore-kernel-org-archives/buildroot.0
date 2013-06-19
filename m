From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Wed, 19 Jun 2013 19:56:34 +1000
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <20130619102133.7570dcd4@skate>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
 <kprol2$uk1$1@ger.gmane.org> <20130619102133.7570dcd4@skate>
Message-ID: <kprv8d$6iq$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> No I don't want the target binutils, but I don't seem to be able to disable
>> it.  It's deselected in the buildroot config, but it still seems to be getting
>> compiled.  How would I go about working out why?  I'm not sure how to debug
>> all the make dependencies.
>
> ./support/script/graph-depends > dependencies.dot
> dot -Tpdf -o dependencies.pdf dependencies.dot
> <Your Preferred PDF Viewer> dependencies.pdf

Do I need to do anything special since I am using "make O=..." to keep the 
output separate from the buildroot git repo?  I get this when I run it in the 
buildroot git folder:

$ ./support/scripts/graph-depends > dep.dot
   File "./support/scripts/graph-depends", line 40
     print "Usage: graph-depends [package-name]"
                                               ^
SyntaxError: invalid syntax

$ python2 ./support/scripts/graph-depends > dep.dot
Getting targets
Traceback (most recent call last):
   File "./support/scripts/graph-depends", line 184, in <module>
     for tg in targets:
TypeError: 'NoneType' object is not iterable

And if I run it in my output folder:

$ python2 ../../../buildroot/support/scripts/graph-depends > dep.dot
Getting targets
Getting dependencies for ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox', 
'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs', 
'rootfs-squashfs']
Error getting dependencies ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox', 
'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs', 
'rootfs-squashfs']

So I'm not sure whether I need to do something differently?

> Another solution is to pastebin your full .config file somewhere and
> give us the link, we may be able to point what's triggering the target
> binutils build.

Here's the link I posted earlier: 
<http://www.shikadi.net/files/buildroot/2013-06-17.br.binutils_elf2flt_err.config> 
but be aware I have made a few changes to buildroot itself (added a few new 
config options), but none that I am aware of that would affect binutils.

Many thanks,
Adam.
