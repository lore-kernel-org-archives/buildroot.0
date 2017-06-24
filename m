From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 23:17:24 +0200
Subject: [Buildroot] [PATCH] Makefile: unconfigured "make toolchain"
 should run menuconfig
In-Reply-To: <0bccbcd6-5201-88e5-5044-66c2f5acc93b@lucaceresoli.net>
References: <7ef9622f-7355-c639-b704-ed7dace1e273@mind.be>
 <20170615201917.16464-1-arnout@mind.be>
 <0bccbcd6-5201-88e5-5044-66c2f5acc93b@lucaceresoli.net>
Message-ID: <20170624231724.4e1c5d7e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Jun 2017 13:19:27 +0200, Luca Ceresoli wrote:

> > +# Some subdirectories are also package names. To avoid that "make linux"
> > +# on an unconfigured tree produces "Nothing to be done", add an explicit
> > +# rule for it.
> > +linux toolchain: menuconfig
> > +  
> 
> This is very localized and documented w.r.t. the other solution, so I
> prefer this one.

Agreed.

> 
> However I prefer how the other solution behaves, i.e. print an
> explicit error message, not call menuconfig.
> 
> How about the following solution?
> 
> .PHONY: linux toolchain
> linux toolchain:
>   @echo 'Please configure Buildroot first (e.g. "make menuconfig")' 1>&2
>   @exit 1
> 
> I'm not sure it's correct, but seems like it works:

+1 with Luca here. Running menuconfig is confusing, I very much prefer
an error message.

Arnout, what do you think? Can you respin with this idea?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
