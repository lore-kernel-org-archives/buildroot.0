From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jan 2012 23:05:50 +0100
Subject: [Buildroot] [PATCH 2/7] lttng-modules: new package
In-Reply-To: <20111222141605.160d5b67@skate>
References: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUiqde1C2zY=aoKkRCc37r-ZASSfavVCX1WmwWT9g=TyA@mail.gmail.com>
 <20111222141605.160d5b67@skate>
Message-ID: <201201122305.51006.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 22 December 2011 14:16:05 Thomas Petazzoni wrote:
> > In fact, since building kernel modules from buildroot is not uncommon
> > anymore (there are some packages in the tree that do it, plus
> > user-specific packages, wouldn't it be a good idea to provide a small
> > infrastructure for building kernel modules? This would prevent such
> > mistakes. Instead of gentargets, we could have something like
> > kernelmodule.
> > What do you think about that?  
> 
> I don't know. I am not exactly sure because there is no real standard
> way for packaging external kernel modules. If you look at linux-fusion,
> RTAI or lttng-modules, you'll see that the build mechanism is very
> different. I'm not sure there is a real pattern here that we can
> factorize nicely in an infrastructure. Which pattern do you see?

 RTAI is different because it is much more than a kernel module.  But I
do see a pattern for linux-fusion, lttng-modules and others I've been
using locally.  They generally have a Makefile that tries to be smart
about the kernel sources, and eventually calls a sub-make as

 $(MAKE) -C $(KERNELDIR) M=$(PWD) <extracflags> <target>

 I think we can do the latter directly from buildroot.

 In some cases there is a user-space component in the same package, but
that normally can be built separately as well.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
