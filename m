From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 4 Sep 2013 10:04:22 +0800
Subject: [Buildroot] Why elf2flt is built *after* busybox
In-Reply-To: <CAFRkauBmG1T5UHKaA5tRvGqPFw2eABrPrPSKeO4L-CCOTyfu=Q@mail.gmail.com>
References: <1378225250.11000.4.camel@phoenix> <20130903193417.1a092fd5@skate>
 <CAFRkauBmG1T5UHKaA5tRvGqPFw2eABrPrPSKeO4L-CCOTyfu=Q@mail.gmail.com>
Message-ID: <CAFRkauChAKfxHt7Z5GwJ3pvpk5iEB9m=+5FuhckGWUQ6SR_4ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This time my question is: Is it normal elf2flt is built *after* busybox?
> (This looks like a new founding to me)
> I know elf2ft is broken.
> I'm just not sure if the build order is one of the root cause to make
> elf2flt broken.
> I ask the question because I'm not familiar with buiildroot now, I even
> don't know how to specify package build order.
> (In this case, move elf2flt build ealier than busybox.)
> So I expect someone can answer the question on mailing list.
Hi,
I test build for blackfin with BR2_PACKAGE_HOST_ELF2FLT=y.
The first time build result in a ELF 32-bit LSB executable.
(I think it is because busybox is built *before* elf2flt.)
However, I build busybox again with "make busybox-rebuild" and
then I got a BFLT executable.
So now I do think the build order for elf2flt does matter.

Regards,
Axel
