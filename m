From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 10 Jul 2017 20:25:33 +0200
Subject: [Buildroot] [PATCH] olimex_imx233: refactor with genimage.sh
In-Reply-To: <20170701174510.08a506bd@windsurf.home>
References: <20170701153433.11906-1-francois.perrad@gadz.org>
 <20170701174510.08a506bd@windsurf.home>
Message-ID: <CAB0FRsu64aDtXhaXNSbjNc67SuK+0BOh+KhZ3emeN73CV-XBjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-07-01 17:45 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sat,  1 Jul 2017 17:34:33 +0200, Francois Perrad wrote:
> > instead of use a freescale script
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Could you explain why this is an improvement? The whole idea of
> board/freescale/common/mxs/post-image.sh is to have a single
> genimage.cfg.template file that covers all MXS boards. So your change
> doesn't seem to go in the right direction.
>
>
First, I like common tools which avoid duplication of effort.

I introduced the use of the common mxs script on November 2016, soon after
its creation by Fabio.

But, I dislike the level indirection given by the template of image
description (the use of this template is good inside board/freescale, but
not outside).

So now, I prefer use the new global common script
support/scripts/genimage.sh.

Fran?ois


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170710/6ec615b8/attachment.html>
