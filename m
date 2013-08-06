From: Steve deRosier <derosier@gmail.com>
Date: Tue, 6 Aug 2013 16:22:53 -0700
Subject: [Buildroot] rebuild dtb?
Message-ID: <CALupW3Cjyr6D_kGPVMGoX=C_0YbdmfJT8t7DREFLvki6Y1odzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I was wondering if there was a make target similar to linux-rebuild that
would force a rebuild of the dtb?

We're using an override to allow a live source tree of the kernel for our
current kernel work. I'm doing some work on the device trees and I'd really
like a way to just rebuild the dtb and attach it to the kernel image.
 Alternately I've been using linux-rebuild and can continue to do so.

However, I've noticed an issue with linux-rebuild with re: to the device
tree.  I have to make a modification to a kernel source (doesn't seem to
matter) to get it to rebuild + cat the dtb with the kernel.  Here's what I
see:

I modify the dts only, then do a `make O=<my output dir> linux-rebuild` and
it does rebuild the dtb, but when I load the kernel on my target, my dts
changes don't take effect.  It doesn't look like it cat'd the dtb with the
kernel and created the image properly.

I modify the dts, and I make a trivial change to a kernel file (in this
case arch/arm/mach-at91/pm.c), it rebuilds the file, the dtb, and
successfully does the cat of the kernel + dtb to make a new image.  When I
deploy it on my target and test, my dts changes are evident.

Thoughts/help?

Thanks,
- Steve
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130806/5d93a56f/attachment-0001.html>
