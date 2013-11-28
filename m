From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Nov 2013 23:21:15 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <20131128212148.5bd51eb8@skate>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
 <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
 <20131128192018.61cf8fdb@skate>
 <CAHXCMM+wT7=ieH3P-xP8DdJzKBXsmADO5KC1EJrwJQK99AP8sg@mail.gmail.com>
 <20131128212148.5bd51eb8@skate>
Message-ID: <20131128222115.GF3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Samuel, All,

On 2013-11-28 21:21 +0100, Thomas Petazzoni spake thusly:
> On Thu, 28 Nov 2013 21:04:04 +0100, Samuel Martin wrote:
> > It does look like this:
> > 
> > BR2_EXTERNAL/
> > |`- board/
> > |    `- someboard/
> > |       |`- linux-myversion/
> > |       |    `- linux-0001-fix-something.patch
> > |       |`- busybox-1.21.1.config
> > |        `- post-build-script.sh
> > |`- configs/
> > |    `- someboard_defconfig
> >  `- package/
> >     |`- Config.in
> >     |`- Config.in.host
> >     |`- foo/
> >     |   |`- foo.mk
> >     |   |`- Config.in
> >     |    `- Config.in.host
> >     |`- bar/
> >     |   |`- bar.mk
> >     |    `- Config.in.host
> >      `- toto/
> >         |`- toto.mk
> >          `- Config.in
> > 
> > With BR2_EXTERNAL/package/Config.in sourcing all Config.in files from
> > BR2_EXTERNAL,
> > and BR2_EXTERNAL/package/Config.in.host sourcing all Config.in.host files
> > from BR2_EXTERNAL,
> > 
> > My point was only about sourcing BR2_EXTERNAL/package/Config.in.host under
> > the
> > "Host utilities" menu.
> 
> I perfectly understand what you mean, but I don't really like the idea
> of sourcing BR2_EXTERNAL/package/Config.in.host, because it means the
> user has to *always* create two Config.in files in its BR2_EXTERNAL
> hierarchy to just get started in using BR2_EXTERNAL.
> 
> So, the reason your comment is *entirely* related to the previous
> discussion is that in my previous proposal, I was including *ONE*
> top-level BR2_EXTERNAL/Config.in, and it was up to the user to then do
> whatever he wanted in this top-level Config.in file. We were not
> enforcing anything.
> 
> I was OK with enforcing the usage of BR2_EXTERNAL/package/Config.in,
> but not if we extend that to also enforce the usage (and existence) of
> BR2_EXTERNAL/package/Config.in.host.

At first, I would have sided with Samuel on that one, since it might
sound a bit ugly to have host packages appear in the target packages
menu.

Yes, we want to enforce the directory layout in BR2_EXTERNAL. But do we
want to enforce the menu structure. too?

In the end I think Thomas is right, but for different reasons: if we
eventually added package/Config.in.host. then we should do the same for
the bootloaders, too. And probably other menus, too. Which means the
user would have to provide all of these files, even empty ones.

Anyway, let's keep it simple for now. We can refine it later if needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
