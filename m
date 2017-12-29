From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 16:27:42 +0100
Subject: [Buildroot] [RFCv3 04/15] pkg-cmake: install CMake files as
 part of a package
In-Reply-To: <20171203235540.395d4714@windsurf.home>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-5-thomas.petazzoni@free-electrons.com>
 <20171203223454.GB4164@scaer>
 <20171203235540.395d4714@windsurf.home>
Message-ID: <20171229152742.GF3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-03 23:55 +0100, Thomas Petazzoni spake thusly:
> On Sun, 3 Dec 2017 23:34:54 +0100, Yann E. MORIN wrote:
> > On 2017-12-01 21:53 +0100, Thomas Petazzoni spake thusly:
> > > Currently, the toolchainfile.cmake and Buildroot.cmake files are
> > > installed outside of any package, just triggered by the toolchain
> > > target.
> > > 
> > > As part of the per-package SDK effort, we are trying to avoid anything
> > > that installs to the global $(HOST_DIR), and this is one of the
> > > remaining files installed in $(HOST_DIR) outside of any package. We
> > > fix this by installing such files as part of the toolchain package
> > > post-install staging hooks.
> > > 
> > > Yes, a post-install staging hook to install things to $(HOST_DIR) is a
> > > bit weird, but the toolchain infrastructure is made of target packages
> > > only, and they all install a lot of stuff to $(HOST_DIR) already.  
> > 
> > What I am more concerned about, is that the cmake package is registering
> > a hook for another package, toolchain.
> 
> Do we want to introduce a toolchain-cmake package, that all CMake
> packages would depend on, just for the sake of installing those files ?
> 
> If we would do this, then a normal toolchain build (i.e without
> building any CMake package) would no longer generate the
> toolchainfile.cmake file, which is quite useful for SDKs. People could
> indeed enable that package explicitly when they are building a SDK.
> 
> But all in all, I'm not sure it's really worth the hassle. But I'm open
> to comments on that.
> 
> Or perhaps you had other suggestions in mind?

No, I don't have a better solution. And in fact, it is not a package
that is registering a hook for another one; it is the cmake infra that
registers a hook for the toolchain package.

And I'm pretty fine with this, in fact.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> > Have you tried to run check-package on that?
> 
> Nope, I did not, but it does not complain:
> 
> $ ./utils/check-package package/pkg-cmake.mk 
> 0 lines processed
> 0 warnings generated

Right, because this is not a package, but a package infra.

Thanks! :-)

Regards,
Yann E. MORIN.

> Thanks for the review!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
