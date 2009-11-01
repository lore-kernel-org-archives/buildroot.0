From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 01 Nov 2009 22:26:58 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <20091027090628.0aa7b0df@surf>
References: <20091025224056.59c9a6ef@surf>  <20091027090628.0aa7b0df@surf>
Message-ID: <1257110818.2515.67.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 27 octobre 2009 ? 09:06 +0100, Thomas Petazzoni a ?crit :
> Hello,
> 
> Le Sun, 25 Oct 2009 22:40:56 +0100,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> I've pushed a set of commits to
> http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=package-infrastructure
> which shows the current status of my work. Warning: it is currently in
> an ugly state: documentation not updated, the generic package
> infrastructure still contains some autotools-specific stuff, the
> autotools infrastructure ported over the generic infrastructure does
> not work yet.
> 
> But it still allows you to see how the .mk files look like for three
> examples : icu, zlib and olsr (randomly choosen).
> 
> Please do not pull this branch anywhere except for experimentations, as
> I will rebase it heavily.
> 
> Sincerly,

Hi Thomas,

First thanks for your work. I like it much, it makes package's makefiles
a lot more clean.

I have little question about the autotool stuff. I seen that the
patching and the autoreconf steps has been merged together. Is it
because you did not finish yet or do you plan keep it like that ?

I'm asking that because I'm using buildroot more as a development tool
than a rootfs generation tool. I try to work upstream with packages I'm
hacking on. A few days ago I sent a patch to allow to retrigger some
part of the build process on a particular package
(http://lists.busybox.net/pipermail/buildroot/2009-October/030104.html).
It currently only work with "autotooled" packages, but with you ongoing
work it will be easier to provide that feature on all packages.

So to me, it is important to separate the patching from the
autoreconfiguring part, because when adding new source files to an
autotooled package there is a need to regenerate the Makefile.in files
without repatching.

Regards,

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
