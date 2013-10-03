From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 17:06:27 +0200
Subject: [Buildroot] Advice on a board support
In-Reply-To: <CA+TH9V=EdvEv4UF1s-ad9EoFCUBZHaoEqgiyqB1wsBUhETJZiQ@mail.gmail.com>
References: <CA+TH9V=EdvEv4UF1s-ad9EoFCUBZHaoEqgiyqB1wsBUhETJZiQ@mail.gmail.com>
Message-ID: <20131003170627.2cdd2a94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 3 Oct 2013 14:39:14 +0200, Angelo Compagnucci wrote:

> Recently I discovered the OLinuxIno nano board form Olimex and I
> really loved every corner of that!
> 
> Now I really want to build a rootfs with buildroot, but unfortunately
> I discovered the board is not supported.
> 
> I really would like to contribute to the buildroot project supporting
> this board, but this will be my first contribution. I read several
> docs and I have a last question open.
> 
> To make this board fully operative, several patches should be applied
> to some specific versions of the linux kernel. Patches are ready
> available[1] but how integrate them with boildroot?
> 
> So my question is: what is the recommended way to support this new platform?

As explained in
http://buildroot.org/downloads/manual/manual.html#customize-store-board-support,
adding the support for a board in Buildroot is a matter of creating a
minimal working configuration. You can also look at the existing
configurations in Buildroot for other boards.

The Git tree you pointed at is unfortunately not a kernel Git tree
which you can directly point Buildroot at. It's a tree that contains
kernel patches, so Buildroot cannot do much with this. However, since
the number of patches is rather small, you can simply copy them in
Buildroot in board/olimex/<boardname>/, and point Buildroot to this
directory for the kernel patches.

Note that the patches in this tree look a bit weird: there are some
patches for AT91 SOCs, and some other patches for i.MX SOCs.

Another option is to find a real kernel Git tree that works for your
platform. Or even better, the mainline kernel!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
