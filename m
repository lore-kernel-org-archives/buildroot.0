From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 May 2017 14:23:04 +0200
Subject: [Buildroot] Cross-compiling out-of-tree kernel modules and
	user-space apps
In-Reply-To: <60824eaa-5a38-a9b7-1394-ae9c5d2a64bf@free.fr>
References: <4e87c694-21a2-7f06-9d88-f736e832e061@free.fr>
 <20170503113509.0d5cd238@free-electrons.com>
 <60824eaa-5a38-a9b7-1394-ae9c5d2a64bf@free.fr>
Message-ID: <20170503142304.07002af5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 May 2017 11:48:28 +0200, Mason wrote:

> > What do you call "its own build system" ?  
> 
> A scary jungle of intertwined / recursive Makefiles. Basically,
> one types 'make all' to build modules, libs, apps, and firmwares.
> Sorting this mess out would be a multi-man-months effort.

You don't need to "sort this mess out". Just create a Buildroot package
that does "make all".

> > Create Buildroot packages for the different software components you
> > need to build.  
> 
> OK, what's the second best way to do this, then?

Again: create a package for it. Whatever you think should be done in a
shell script can be done in a Buildroot package, so there is no reason
to not create a Buildroot package for your stuff.

You don't necessarily need to split it into multiple Buildroot
packages. It can be just one big Buildroot package that calls your
"make all" stuff to build your home-grown apps/libs/modules in one go.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
