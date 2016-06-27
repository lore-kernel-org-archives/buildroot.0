From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jun 2016 00:39:36 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
 menuconfig
In-Reply-To: <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
Message-ID: <20160627223936.GD3714@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-06-28 00:27 +0200, Arnout Vandecappelle spake thusly:
> On 27-06-16 22:57, Yann E. MORIN wrote:
> [snip]
> > And looking at the commit that introduced it for linux, it is exactly
> > the case that would have been covered by an override-srcdir:
> > 
> >     commit 73da2ff6f718f2889e3c5024d899f8d58f502863
> >     Author: Rafal Fabich <rafal.fabich@gmail.com>
> >     Date:   Sat Feb 23 19:03:30 2013 +0100
> > 
> >         Added local directory as source of kernel code
> >     
> >         Add the option to use a local directory as the source for
> >         building the Linux kernel, which can be useful during
> >         kernel development.
> >     
> >         Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
> >         Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >         Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >         Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > 
> > Peter, any reason that you applied this patch at the time?
> > Arnout, anything you remember for giving your ACK?
> 
>  I think at the time I considered using _OVERRIDE_SRCDIR for something like this
> too clunky. However, now I'm more convinced that every realistic project should
> have an automatic _OVERRIDE_SRCDIR for everything in $(BR2_EXTERNAL)/src. So
> then indeed this option is not so relevant anymore.

Well, any two projects would have different workflows, so suggesting a
"realistic project" uses an automated override-srcdir is just pushing
the limits too much, IMHO.

Besides, my opinion is that having the sources for packages in the
br2-external tree is bad, and that each package should have its own
git/hg/svn/bzr tree. But that varies between projects! ;-)

>  It's still a bit clunky, though, that your (def)config has to specify
> _something_ for the kernel version, but that it will never be used in practice.

Well, that would be the same for any package for which we have a version
choice when an override-srcdir is in use for that package...

And anyway, any override-srcdir should not be versioned I think. It
should be purely for local development.

>  I propose to reject this patch but keep the existing LINUX_CUSTOM_LOCAL around
> for a bit still.

Well, I saw your mail after I sent the patch, so... ;-)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > So, I would think that:
> >   1- we don't want this for U-Boot;
> >   2- we should drop it for Linux.
> > 
> > Peter, Thomas, Arnout: what do you think?
> [snip]
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
