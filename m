From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:06:55 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
 <20180815213421.08e0a3b6@windsurf>
 <87ftzf9v7u.fsf@dell.be.48ers.dk>
 <20180816001829.3f7a1436@windsurf>
 <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
Message-ID: <20180816220655.37fbff34@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Aug 2018 21:52:25 +0200, Thomas De Schampheleire wrote:

> > I don't think it's related to building with new compilers. It's just
> > some U-Boot versions that are broken if libfdt headers are already
> > available in the include path.
> 
> I can try to have a look somewhere next week.

OK, thanks.

> From the previous solution, I have a feeling that we can only go so
> far in trying to solve the issue from Buildroot. We did already one
> thing, and it seems insufficient for some u-boot versions.
> There is a risk that what we do to fix these new failures, may break
> some of those that work today.
> We could implement some kind of detection to see how we need to solve
> the issue depending on the u-boot at hand, but it could be cumbersome.

Indeed.

> An alternative solution is to document the known solution to this
> problem (the patches). We can apply these patches to the defconfigs
> inside buildroot, and let users with custom u-boots apply the patches
> themselves (i.e. make them aware from release notes or documentation
> but don't solve it automatically).

That would be an option yes, but not the nicest one. But still better
than having all the defconfigs failing like they are today :/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
