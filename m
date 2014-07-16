From: Mike Zick <minimod@morethan.org>
Date: Wed, 16 Jul 2014 12:36:48 -0500
Subject: [Buildroot] git binary diffs are not supported
In-Reply-To: <20140716152504.4bd10dbb@free-electrons.com>
References: <53C665B1.6050609@posteo.de>
 <20140716152504.4bd10dbb@free-electrons.com>
Message-ID: <20140716123648.47d7b652@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Jul 2014 15:25:04 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear J?rg Krause,
> 
> On Wed, 16 Jul 2014 13:44:49 +0200, J?rg Krause wrote:
> 
> > I am trying to apply a git binary patch to add a firmware binary
> > blob to the linux kernel firmware directory. I am using git
> > format-patch --binary -M -n -s to create the patch and copy it to
> > the global patch directory. Trying to build linux fails while
> > patching with the following error message:
> > 
> >     git binary diffs are not supported.
> > 
> > Do I missed something? I would be glad for any advice!
> 
> We don't use git to apply patches when building packages in Buildroot,
> we use the plain old patch, which indeed doesn't support binary diffs.
>

The bsdiff / bspatch pair of utilities is probably still the preferred
tools for patching binaries.

With that thought in mind, it should still be possible to find an
alternative to patching binaries in a build system.

Those utilities where intended for use in post-build situations.

Mike

> Not sure how to solve this situation. Does your firmware really needs
> to be part of the kernel build process? Can't it be loaded from the
> filesystem at boot time, as is done for all the firmwares in the
> linux-firmware package? If that was possible, then you would simply
> have to create a simple Buildroot package that installs your firmware
> into /lib/firmware/.
> 
> Best regards,
> 
> Thomas
