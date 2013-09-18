From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 17:56:55 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <52394EEA.4000603@mind.be>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be> <20130917203726.5b02fe08@skate>
 <52394EEA.4000603@mind.be>
Message-ID: <20130918175655.3f3a8466@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 18 Sep 2013 08:57:46 +0200, Arnout Vandecappelle wrote:

> > No, I disagree with this. There are some other packages (currently
> > udisks and network-manager) that explicitly need the udev extras. So I
> > believe it's useful for these packages to be able to 'select
> > BR2_PACKAGE_UDEV_ALL_EXTRAS'. Of course, they could 'select
> > BR2_PACKAGE_LIBGLIB2' and depend on udev, but this means that they have
> > internal knowledge of the fact that udev needs libglib2 to enable 'all
> > extras', an internal knowledge that could very well be broken if
> > tomorrow udev needs another dependency to build its 'all extras' things.
> >
> > So, the BR2_PACKAGE_(E)UDEV_ALL_EXTRAS option should remain in place, I
> > believe.
> 
>   I didn't write the network-manager and udisks integration, but I think 
> that they _actually_ need gudev, not some vague "all extras". And for 
> gudev it's pretty darn obvious that there is a relation with libglib2. In 
> fact, both of them should probably select libglib2 directly, because they 
> are based on gobject classes.

Right, that's one way of seeing things, indeed. It sounds a bit
convoluted to me, though. When a package A needs a specific feature
from package B (such as gudev), I believe it makes sense for package B
to provide a sub-option that package A can select, rather than package
A having intimate knowledge of the dependencies needed by package B to
enable whatever feature package A needs to have from package B.

No?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
