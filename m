From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:24:41 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <20151012211618.GG3735@free.fr>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr>
 <20151012224411.472a9d10@free-electrons.com>
 <20151012211618.GG3735@free.fr>
Message-ID: <20151012232441.3322b2fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 12 Oct 2015 23:16:18 +0200, Yann E. MORIN wrote:

> > I agree on the principle, but I think we should rather handle that like
> > we do for other options: enable automatically the needed option.
> 
> Except for PCI it does not really makes sense, see Arnout's explanations:
>     http://lists.busybox.net/pipermail/buildroot/2015-October/141178.html

Except that I disagree with Arnout :)

Arnout is not making the difference between being able to *build* and
being able to *run*.

CONFIG_PCI is needed for the build to proceed, so it is normal that we
enable it automatically. The PCI root complex drivers are only needed
for the PCI support to actually work on the target, not for iqvlinux to
build.

And the story is the same for xtable-addons: the additions in linux.mk
were made because those kernel options were needed for xtable-addons to
simply *build*.

> > Remember how someone proposed to check for CONFIG_MODULES=y and error
> > out if not available? Instead, you implemented
> > b7c32c98bc810b88e0391117f225658f82b44995.
> 
> Meh... ;-)

No, your commit is good I believe.

> I'm not totally oposed to this idea.
> 
> However, there are cases, like PCI, for which it does not make sense to
> just enable it (as Arnout explained).

See above :)

> Unless we don't care about runtime consistency, and just care about the
> buildability of the configuration...
> 
> However, I like doing such little tiny bit of infra, so I can append that
> to my todo-list. What do you prefer: setting the option (like for
> modules), or checking the option?

Setting the option, when it is needed to build the external modules.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
