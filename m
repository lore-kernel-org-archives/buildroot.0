From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 20:24:44 +0200
Subject: [Buildroot] How to build xipImage?
In-Reply-To: <AANLkTil6Ynz6Ab5p-uPRd1AFB7L98L2TtC2YeYmnN25j@mail.gmail.com>
References: <AANLkTil6Ynz6Ab5p-uPRd1AFB7L98L2TtC2YeYmnN25j@mail.gmail.com>
Message-ID: <20100727202444.76f9f85d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Jul 2010 20:09:30 +0200
Rossi Mario <cammello@gmail.com> wrote:

> I'm trying to build an xipImage.
> 
> In  linux26-menuconfig  i enabled  "Kernel Execute In Place from ROM"
> but when compiling it, there is an error  "Kernel configured for XIP
> etc etc" "Only the xipImage target etc".

Can you give the full errors and not just "etc etc" ?

> How can i set this values if in "kernel binary format" there is not
> it?

We can add support for this in the list of kernel binary format. On
ARM, it seems one must build the kernel with "make xipImage" to get a
XIP image. Would this be enough ?

If so, please try the attached (untested) patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xipimage.patch
Type: text/x-patch
Size: 804 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100727/66efcca3/attachment.bin>
