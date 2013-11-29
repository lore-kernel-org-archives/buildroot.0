From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Nov 2013 09:38:15 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <20131128222115.GF3337@free.fr>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
 <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
 <20131128192018.61cf8fdb@skate>
 <CAHXCMM+wT7=ieH3P-xP8DdJzKBXsmADO5KC1EJrwJQK99AP8sg@mail.gmail.com>
 <20131128212148.5bd51eb8@skate> <20131128222115.GF3337@free.fr>
Message-ID: <20131129093815.5e0aee68@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 28 Nov 2013 23:21:15 +0100, Yann E. MORIN wrote:

> > I perfectly understand what you mean, but I don't really like the idea
> > of sourcing BR2_EXTERNAL/package/Config.in.host, because it means the
> > user has to *always* create two Config.in files in its BR2_EXTERNAL
> > hierarchy to just get started in using BR2_EXTERNAL.
> > 
> > So, the reason your comment is *entirely* related to the previous
> > discussion is that in my previous proposal, I was including *ONE*
> > top-level BR2_EXTERNAL/Config.in, and it was up to the user to then do
> > whatever he wanted in this top-level Config.in file. We were not
> > enforcing anything.
> > 
> > I was OK with enforcing the usage of BR2_EXTERNAL/package/Config.in,
> > but not if we extend that to also enforce the usage (and existence) of
> > BR2_EXTERNAL/package/Config.in.host.
> 
> At first, I would have sided with Samuel on that one, since it might
> sound a bit ugly to have host packages appear in the target packages
> menu.
> 
> Yes, we want to enforce the directory layout in BR2_EXTERNAL. But do we
> want to enforce the menu structure. too?
> 
> In the end I think Thomas is right, but for different reasons: if we
> eventually added package/Config.in.host. then we should do the same for
> the bootloaders, too. And probably other menus, too. Which means the
> user would have to provide all of these files, even empty ones.
> 
> Anyway, let's keep it simple for now. We can refine it later if needed.

In other words, you're suggestion to revert back to the principle of
the v2 in terms of .mk file and Config.in inclusion? (I.e include a
top-level .mk file and top-level Config.in, and let the user do what he
wants?).

I personally believe this is the easiest and most flexible solution. We
can always state in the manual that we strongly recommend to keep a
directory structure similar to the one used in Buildroot. But at least
the user can organize its top-level menu as he sees fit (maybe even
using it to add board-specific config options, which we don't want in
Buildroot itself, but which a user may want for some reason).

The main improvement of v3 is the usage of the .br-external hidden
file, and this remains useful, so I'm really fine about reverting the
other part of v3 to what was done in v2 :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
