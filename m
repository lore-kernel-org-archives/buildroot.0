From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 May 2016 23:40:57 +0200
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
 host-dtc for the host package
In-Reply-To: <87r3dgmf7w.fsf@dell.be.48ers.dk>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <20160505220901.4db9e9a2@free-electrons.com>
 <87r3dgmf7w.fsf@dell.be.48ers.dk>
Message-ID: <20160505214056.GB4367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-05-05 22:17 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  >> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
> 
>  > I am not sure I like the idea of having host-uboot-tools always depend
>  > on host-dtc, as it adds build time while host-dtc is only needed for
>  > some specific use cases of mkimage (generating FIT images).
> 
>  > There are really three options I believe:
> 
>  >  (1) What you did, i.e have host-dtc as an unconditional dependency of
>  >      host-uboot-tools. Everybody pays the price of building host-dtc
>  >      even if it's not needed.
> 
>  >  (2) Add a sub-option to host-uboot-tools so that people can say "I
>  >      need it with FIT image support", which will add host-dtc as a
>  >      dependency.
> 
>  >  (3) Just do nothing, and let our users be smart enough to realize that
>  >      when mkimage complains that dtc is missing, they should enable
>  >      host-dtc.
> 
> Agreed, it's quite similar to the issues with genimage and
> dosfstools.

I'm always a bit uneasy speaking about genimage, as I don't use it.

However, I would contend that we should try to provide as much a "works
out of the box" experience as possible, so I'd lean on the side of
always enable optional packages to make genimage always happy.

But then, genimage being so versatile, it would be perfectly possible to
ask it to build all sorts of filesystems, or aggregate all sorts of
blobs (e.g. DTB), and so on. Should we forcibly enable all those tools
when genimage is enabled?

I guess not.

Granted, most of the boards we currently have use a VFAT partition
(except those from boundary devices, the wandboard and the
a20_olinuxino, i.e. 4 boards).

So, I'm completely undecided for genimage.

On the one side, there the "out of the box" experience; on the other
side, there's the build time...

But dosfstools has no dependency, and it does build quite fast, so we
could at least enable that one...

> Either option 2 or 3 sounds good to me.

Hmm... See my other reply for why I think option #1 is better. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
