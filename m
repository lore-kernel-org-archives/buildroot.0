From: Christian Stewart <christian@paral.in>
Date: Mon, 10 Apr 2017 17:45:19 -0400
Subject: [Buildroot] Building multi-part rootfs images
Message-ID: <CA+h8R2ofinZ+3yGzNOCtfM5KDSrxeizyEVAKTYv2v24DbEPzkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all:

I'm building OS images with Buildroot using the "rootfs cpio" approach,
where the entire OS is loaded into RAM as an initramfs.

I like this approach a lot, especially when it comes to reliability, but
I'm running into issues with the size of the image impacting the boot time,
since obviously the entire boot is stalled until the image is loaded into
memory.

I'm now interested in doing something like:

 - Load minimal initramfs
 - Loop-mount /lib/modules from a second image, deferring the
"copy-to-memory" for kernel modules until they are actually probed on
demand.

What do you think the best way to do this would be? Turn off all of
Buildroot's rootfs build steps and make my own post-build step? Is this
possible, fitting within the Buildroot rootfs mechanisms? Is this approach
worth integrating into Buildroot in some way?

Any suggestions you may have would be greatly appreciated.

Best,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170410/fc33a207/attachment.html>
