From: John Voltz <john.voltz@gmail.com>
Date: Thu, 6 Mar 2008 20:10:41 -0500
Subject: [Buildroot] Huge update
Message-ID: <46a136670803061710ka7f2c40u223e1348b1a04d21@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 > --- trunk/buildroot/scripts/build-ext3-img
 (rev 0)
> +++ trunk/buildroot/scripts/build-ext3-img    2008-03-06 17:52:37 UTC (rev
21176)

Why isn't this just a normal target? Or an option to the current ext2
target?

I would like to do that once I find a good way to do it. It will create a
bootable ext3 image with grub that can be run directly with qemu or vmware.
I've been trying to get this to work with minimal success. I don't think
anyone has built a buildroot image for x86 since uClibc 0.9.27 was around,
it doesn't seem to work.

The move to /usr/lib was partly because a few embedded systems have the root
file system stored in a smallish flash device on the main board, sufficient
to boot the kernel, start networking, and get into a shell. The /usr
directory can be mounted with a removable device such as an SD card and hold
more enormous contents. Also, a lot of regular packages expect to find most
of these libraries in /usr/lib, from what I've experienced.

> Added:
>    trunk/buildroot/package/editors/

Why add hierarchy into the package directory?

It's getting a bit crowded in there I think. But this wasn't my work, it was
Arnar Mar Sigurdsson from Valka Ehf.

> fixed jpeg makefile

(Moved from /lib to /usr/lib.)

What does this fix?

I forgot now. Some other package, probably glib or gtk, placed it in it's
package config flags as /usr/lib and then other packages couldn't find it.
Hard coded paths are the bestest.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080306/9568a53c/attachment.htm 
