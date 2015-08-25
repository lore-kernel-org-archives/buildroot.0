From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 15:12:31 +0200
Subject: [Buildroot] [PATCH] package/canfestival: don't build in parallel
In-Reply-To: <20150825115550.GA3794@free.fr>
References: <1440279290-18408-1-git-send-email-yann.morin.1998@free.fr>
 <20150825121736.0d3982d4@free-electrons.com>
 <20150825115550.GA3794@free.fr>
Message-ID: <20150825151231.43abeaa8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, 25 Aug 2015 13:55:50 +0200, Yann E. MORIN wrote:

> > Do you actually understand why make is displaying those warning
> > messages in the first place?
> 
> Yes, and it's a bit tricky.
> 
> canfestival indeed uses $(MAKE) everywhere. However, it is using it in a
> variable, like so:
> 
>     define build_cmds
>         $(MAKE) foo
>         $(MAKE) bar
>     endef
> 
>     all:
>         $(build_cmds)
>
> Since $(MAKE) is not directly in the rule body, it looses its magic
> behaviour. This is explicited said so in the make manual:
> 
>     This special feature is only enabled if the MAKE variable appears
>     directly in the recipe: it does not apply if the MAKE variable is
>     referenced through expansion of another variable.
> 
> Ergo.

I have to say I really like working on Buildroot with smart people,
because I learn things every day. Thanks for pointing me to this part
of the documentation I overlooked! I will apply your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
