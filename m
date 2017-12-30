From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 14:32:52 +0100
Subject: [Buildroot] How to apply RT kernel patches?
In-Reply-To: <CAF_dkJBtZ=gS8-GQme7eCYyZPRcHPFdYWTsOv=8kQvFdHbfJEA@mail.gmail.com>
References: <CAF_dkJBtZ=gS8-GQme7eCYyZPRcHPFdYWTsOv=8kQvFdHbfJEA@mail.gmail.com>
Message-ID: <20171230133252.GD2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2017-12-30 08:16 -0500, Patrick Doyle spake thusly:
> How do folks tend to apply the RT kernel patches using buildroot?
> 
> There are patch sets available at
> https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/.  I could
> download one of those, unpack it into my buildroot tree, and configure
> that directory as a patch directory for the kernel.  But that is
> problematic from a version control standpoint.  I would end up with
> the whole set of (300+) patches in my source tree that will lead to
> repository bloat.
> 
> I would rather convince the buildroot machinery to download and apply
> the patches automatically as part of the build process.

Have you tried setting:
    BR2_LINUX_KERNEL_PATCH="https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/patches-4.9.68-rt60.tar.xz"

As far as I remember, this is is supposed to work, because we do have
explicit support for handling (un)compressed tarballs of patches.

Regards,
Yann E. MORIN.

> Do others do this?
> 
> Do others do something else?
> 
> I think I'll just toss this question out there and see what I can learn.
> 
> Thank you.
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
