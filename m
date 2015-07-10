From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:16:18 +0200
Subject: [Buildroot] [PATCH v7 22/22] cpio: new package
In-Reply-To: <CANn-YGTt5AoiV=5ht_4krY6EvVNTih=tiYqDoty6WmykeqkFug@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-23-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706123840.61ff3672@free-electrons.com>
 <CANn-YGTt5AoiV=5ht_4krY6EvVNTih=tiYqDoty6WmykeqkFug@mail.gmail.com>
Message-ID: <20150711001618.44eb6d3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton, 

On Fri, 10 Jul 2015 16:02:41 -0500, Clayton Shotwell wrote:

> > What is the motivation to have a host variant of cpio? cpio is already
> > part of the mandatory programs that Buildroot checks for at the
> > beginning of every build: it must be installed on the host system prior
> > to running Buildroot.
> 
> Well I am not using it for anything in particular, I really just need
> the target variant. I can remove the host option without any impact to
> anything.

Well, if you don't use it, then I'd prefer to not support the host
build, especially since cpio is already a mandatory dependency of
Buildroot.

We do have cases (like tar) where we support building a host option
even if it's a mandatory dependency, because some platforms have a too
old tar for Buildroot.

> 
> > If the ArchLinux patches apply without any adaptation, have you
> > considered using:
> >
> > CPIO_PATCH = \
> >         https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-stdio.in.patch?h=packages/cpio \
> >         ...
> >
> > instead ?
> 
> I always forget that is an option because I cannot freely download
> stuff behind our firewall. I'll look at changing the patches to links
> to make things simpler but I may have issues testing that all the
> links work properly.

I can test before committing, no problem with that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
