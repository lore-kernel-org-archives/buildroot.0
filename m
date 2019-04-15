From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 08:57:24 +0200
Subject: [Buildroot] [RFC 1/1] toolchain-external/Config.in: Allow to
 select custom external-toolchain package
In-Reply-To: <f0ea00e5-8b75-807d-a1cd-245cd3bd080d@mind.be>
References: <20190414212654.14910-1-vadim4j@gmail.com>
 <f0ea00e5-8b75-807d-a1cd-245cd3bd080d@mind.be>
Message-ID: <20190415085724.0528c3f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Apr 2019 23:39:38 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > +config BR2_TOOLCHAIN_EXTERNAL_OTHER
> > +	bool "Other"
> > +	help
> > +	  Use this option to use a external toolchain from custom package
> > +	  (e.g. in external project).  
> 
>  So, the idea is to extend the choice with toolchains that come from
> BR2_EXTERNAL and that you can't select here, right? And you need something like
> that because it's a choice, and there's no way to extend the choice in a
> different Kconfig file.
> 
>  I think this is a worthwhile idea, so I'd like to work it out a little more...
> Adding Yann in Cc since he like that kind of external craziness :-)
> 
>  If kept like this, then I think you should make it depend on a new (blind)
> BR2_TOOLCHAIN_EXTERNAL_OTHER_AVAILABLE option, and that an external toolchain
> package should select that option. This way, the option is only available if
> your external tree actually makes one available.
> 
>  Also, it should be documented in docs/manual/customize-outside-br.txt.
> 
>  However, it's still pretty inconvenient for the user. So perhaps we could
> explicitly extend the external infra to generate a .br2-external.toolchain.in
> that is included from here. This file would be populated based on the file
> toolchain/Config.in in the external.
> 
>  Thomas, is that idea over-engineered?

It is over-engineered, but there is not much choice if we want to allow
implementing external toolchains in BR2_EXTERNAL, which would
definitely be useful.

The downside of Vadim's approach is that it limits the BR2_EXTERNAL to
implementing only one external toolchain, since it's only adding one
entry to the choice. Your approach would be more flexible.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
