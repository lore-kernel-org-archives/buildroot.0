From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2011 10:02:44 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] Add Xenomai real-time framework
In-Reply-To: <20110915091319.22f2a11b@skate>
References: <patchbomb.1316004973@localhost6.localdomain6>
 <201109150744.47121.arnout@mind.be> <20110915091319.22f2a11b@skate>
Message-ID: <201109151002.45984.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thursday 15 September 2011 09:13:19, Thomas Petazzoni wrote:
> > > Xenomai comes with a Linux Kernel and user-space part.
> > > I added a Linux extensions sub-menu (The first patch) which handles
> > > the kernel modification provided by Adeos/Xenomai. The advantage of
> > > this way is for maintenance purpose. (Xenomai do not provide a full
> > > kernel patch, but use a script called "prepare-kernel.sh")
> > > Also, this split the user-space from the kernel in a nice way
> > > instead of adding a serie of patches.
> >
> > 
> >  I don't agree with this split.  When you're configuring Xenomai, I
> >
> > think you want the Adeos patch and the other Xenomai configuration in
> > a single place, not spread over two separate menu items.  And the
> > same reasoning goes for maintaining the buildroot parts of Xenomai.  
> 
> Yes, but the Buildroot infrastructure makes it a lot easier to
> integrate the Xenomai userspace libraries separately from the
> kernel-side patching integration. Moreover, as detailed in the
> documentation, there are people who do not use Buildroot to build their
> kernel, but only to build their root filesystem.
> 
> Or maybe I missed your point ?

 I guess :-)

 I'll give two examples:

1. You use buildroot for building kernel and Xenomai userspace (which I think 
is the usual case).  Now you want to use kernel 2.6.38 instead of 2.6.35 (the 
latest included in Xenomai 2.5.6), so you download the appropriate Adeos 
patch.  In this case you have to go to a completely different configuration 
menu to configure your Xenomai setup.

You could say that the Adeos patch config option is conveniently close to the 
kernel version option, but if you're using the buildroot toolchain and 'kernel 
same as toolchain kernel headers', it's not.

2. You're updating the buildroot support for Xenomai.  The new Xenomai version 
requires you to call prepare-kernel.sh in a slightly different way.  Now you 
have to look in two different directories and two different makefiles to keep 
things consistent.


 It's no big issue, but I simply don't see the advantage of splitting in this 
way.  Putting the 'Xenomai kernel patch' option right below the 'Xenomai 
userspace' option instead of in a completely different menu doesn't stop you 
from selecting either or both.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
