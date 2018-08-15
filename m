From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 21:34:21 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <87600bbg68.fsf@dell.be.48ers.dk>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
Message-ID: <20180815213421.08e0a3b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 21:09:19 +0200, Peter Korsgaard wrote:

>  >    The problem is fixed in U-Boot 2018.01 but present in 2017.11.
>  >    However, we have a number of vendor-provided U-Boot, and it's not
>  >    necessarily easy to upgrade all defconfigs to use at least 2018.01.  
> 
> Perhaps we could backport the changes and add as patches for the
> affected defconfigs?

The problem is that it will still affect anyone doing a U-Boot build,
outside of the defconfigs.

> What is needed? Just the libfdt.h -> linux/libfdt.h you reported?

I am not sure what is needed exactly.

>  >  - Problem of recent U-Boot that needs host-bison to build kconfig.
>  >    Yann posted a patch series to make bison and flex hard requirements
>  >    of Buildroot. Do we want to go this way ?  
> 
> Sorry, I haven't looked at that series yet. If various packages start
> needing this, and there aren't any version dependencies, then requiring
> bison and flex is imho not a big problem (E.G. they are generally
> available on all distributions).

We've been having a discussion on this in a separate thread (search
"[2/3,v3] linux: kconfig needs host-{flex, bison} to build the
configurators ").

>  >    sheevaplug_defconfig
>  >    https://gitlab.com/buildroot.org/buildroot/-/jobs/88314946  
> 
> I still have this board somewhere. I'll take a look at bumping u-boot.

OK, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
