From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 22:07:27 +0100
Subject: [Buildroot] [PATCH 3/5] toolchain-configs.csv: re-organize for
 test-pkg
In-Reply-To: <20171029173536.GG2899@scaer>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
 <20171029171440.8095-4-thomas.petazzoni@free-electrons.com>
 <20171029173536.GG2899@scaer>
Message-ID: <20180323220727.5a137de4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the review, finally getting back to this old patch series!

On Sun, 29 Oct 2017 18:35:36 +0100, Yann E. MORIN wrote:

> I would have done something else:
> 
>     N:path:arch
> 
> where:
>   - N is an integer that is the importance of the toolchain, in the
>     range [0..9], with 0 the most important and 9 the least important.
> 
>  - path and arch as they are today.
> 
> So we'd tag the toolchains between 0 and 9, and default to test those <3
> for example.
> 
> Which allows us to keep the ordering of the toolchain, which is nice.
> 
> But I'm also OK with your solution, just suggesting an alternative.

I don't find adding another field really necessary. After all, all we
need is to distinguish the "important" ones from the "other" ones.

>     # Toolchains used by default:

Fixed.

> > +# All other toolchains  
> 
>     # All other toolchains, not used by default:

Fixed.

> Do we want to reorder the remaining list by relevance, too, so that a
> -n12 would pick the 12 most relevant toolchains?
> 
> Or are we just happy that the 7 first are ordered, and we don't care
> about the rest?

I think it will be difficult to define a "relevance order", nobody will
agree on what is the correct order for all those toolchains, and it is
not super important either. I'm not even sure my "-n" argument to
test-pkg makes a lot of sense. Really the "default" or "all" case are
what I really wanted to add.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
