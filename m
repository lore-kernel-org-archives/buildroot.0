From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 25 Jul 2014 16:21:49 -0700
Subject: [Buildroot] [PATCH 0/2] gst-fsl-plugins: requires kernel
 headers <= 3.10 (branch yem/quickies)
In-Reply-To: <20140726003203.355212eb@free-electrons.com>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
 <20140726003203.355212eb@free-electrons.com>
Message-ID: <CADCpmyOc10i+Mn3kwgvKZWuQ9ZQJqa0z9pukODpvZqz9K66RWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann, all,

On Fri, Jul 25, 2014 at 3:32 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Yann E. MORIN,
>
> On Fri, 25 Jul 2014 23:28:11 +0200, Yann E. MORIN wrote:
>
> > As reported by Gary, gst-fsl-plugins use part of the v4l2 API that was
> > removed in linux 3.11, so it should not be made available for toolchains
> > with kernel headers >= 3.11, but only for headers <= 3.10.
>
> That's kind of odd. Isn't the kernel to userspace API supposed to
> remain backward compatible? Isn't this rather a story of custom v4l2
> APIs added by Freescale but never mainlined?
>
>
I confirm the structure disappeared in between kernel 3.10 and 3.11 (see
include/uapi/linux/videodev2.h). Commit b71c9980 explains that this
structure
and the associated ioctl were deprecated and therefore removed.
In other words Freescale shouldn't use that structure. I'll offer another
patch
that replaces chip_ident by chip_info.

Thanks,
Gary


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140725/08472c55/attachment.html>
