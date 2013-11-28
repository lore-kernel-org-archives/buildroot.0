From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 21:21:48 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <CAHXCMM+wT7=ieH3P-xP8DdJzKBXsmADO5KC1EJrwJQK99AP8sg@mail.gmail.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
 <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
 <20131128192018.61cf8fdb@skate>
 <CAHXCMM+wT7=ieH3P-xP8DdJzKBXsmADO5KC1EJrwJQK99AP8sg@mail.gmail.com>
Message-ID: <20131128212148.5bd51eb8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 28 Nov 2013 21:04:04 +0100, Samuel Martin wrote:

> > Then please talk to the people who asked for enforcing
> > $(BR2_EXTERNAL)/package/Config.in usage during the Buildroot Developers
> > Days in Edinburgh.
> 
> I thought the ml was the place for this...

It is indeed. But understand that it's a little bit annoying to get
some review at the Buildroot Developer Days (to which you
participated), change the patches accordingly, and then get some review
that goes in the opposite direction once you post the new version of
the patches.

> > This decision/choice is written very clearly in
> > http://elinux.org/Buildroot:DeveloperDaysELCE2013#BR2_EXTERNAL :
> >
> > """
> > Regarding the directory hierarchy in the external tree, it was agreed
> > that it is a good idea to force three subdirectories: package, board,
> > configs. Buildroot's package/Config.in will source
> > $BR2_EXTERNAL/package/Config.in.
> > """
> >
> Doh! I don't mean this at all! Looks like I was not clear enough.
> 
> I'm not talking about the directory hierarchy, I do follow the Buildroot
> hierarchy.
> It does look like this:
> 
> BR2_EXTERNAL/
> |`- board/
> |    `- someboard/
> |       |`- linux-myversion/
> |       |    `- linux-0001-fix-something.patch
> |       |`- busybox-1.21.1.config
> |        `- post-build-script.sh
> |`- configs/
> |    `- someboard_defconfig
>  `- package/
>     |`- Config.in
>     |`- Config.in.host
>     |`- foo/
>     |   |`- foo.mk
>     |   |`- Config.in
>     |    `- Config.in.host
>     |`- bar/
>     |   |`- bar.mk
>     |    `- Config.in.host
>      `- toto/
>         |`- toto.mk
>          `- Config.in
> 
> With BR2_EXTERNAL/package/Config.in sourcing all Config.in files from
> BR2_EXTERNAL,
> and BR2_EXTERNAL/package/Config.in.host sourcing all Config.in.host files
> from BR2_EXTERNAL,
> 
> My point was only about sourcing BR2_EXTERNAL/package/Config.in.host under
> the
> "Host utilities" menu.

I perfectly understand what you mean, but I don't really like the idea
of sourcing BR2_EXTERNAL/package/Config.in.host, because it means the
user has to *always* create two Config.in files in its BR2_EXTERNAL
hierarchy to just get started in using BR2_EXTERNAL.

So, the reason your comment is *entirely* related to the previous
discussion is that in my previous proposal, I was including *ONE*
top-level BR2_EXTERNAL/Config.in, and it was up to the user to then do
whatever he wanted in this top-level Config.in file. We were not
enforcing anything.

I was OK with enforcing the usage of BR2_EXTERNAL/package/Config.in,
but not if we extend that to also enforce the usage (and existence) of
BR2_EXTERNAL/package/Config.in.host.

As you can see, your comment is *completely* related to the previous
proposal.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
