From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Sep 2011 09:13:19 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] Add Xenomai real-time framework
In-Reply-To: <201109150744.47121.arnout@mind.be>
References: <patchbomb.1316004973@localhost6.localdomain6>
 <201109150744.47121.arnout@mind.be>
Message-ID: <20110915091319.22f2a11b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 15 Sep 2011 07:44:46 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > Xenomai comes with a Linux Kernel and user-space part.
> > I added a Linux extensions sub-menu (The first patch) which handles
> > the kernel modification provided by Adeos/Xenomai. The advantage of
> > this way is for maintenance purpose. (Xenomai do not provide a full
> > kernel patch, but use a script called "prepare-kernel.sh")
> > Also, this split the user-space from the kernel in a nice way
> > instead of adding a serie of patches.
> 
>  I don't agree with this split.  When you're configuring Xenomai, I
> think you want the Adeos patch and the other Xenomai configuration in
> a single place, not spread over two separate menu items.  And the
> same reasoning goes for maintaining the buildroot parts of Xenomai.  

Yes, but the Buildroot infrastructure makes it a lot easier to
integrate the Xenomai userspace libraries separately from the
kernel-side patching integration. Moreover, as detailed in the
documentation, there are people who do not use Buildroot to build their
kernel, but only to build their root filesystem.

Or maybe I missed your point ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
