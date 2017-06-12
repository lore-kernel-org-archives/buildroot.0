From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 15:32:42 +0200
Subject: [Buildroot] [PATCH] syslinux: Add patch to build with the
 latest gnu-efi release
In-Reply-To: <20170612152032.5c2c99ae@armant.office.greenbone.net>
References: <1497003638-17662-1-git-send-email-benoit.allard@greenbone.net>
 <20170611153750.22323da6@windsurf.home>
 <20170612152032.5c2c99ae@armant.office.greenbone.net>
Message-ID: <20170612153242.6f5ddb57@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 15:20:32 +0200, Beno?t Allard wrote:

> > The problem is that it builds a tool called "wrapper" with the
> > cross-compiler, and then tries to run it on the host. It might work if
> > your host and target use the same architecture and libc. Here, I'm
> > using the same architecture (x86-64) but not the same libc (glibc for
> > the host, uclibc for the target).
> > 
> > Do you think you could have a look?  
> 
> I just sent a patch about that. Thanks for noticing, and reporting the
> issue.

Thanks, I'll have a look.

> > Nit: please use 'git format-patch -N' to generate your patches. This
> > will generate patches with [PATCH] as a prefix instead of [PATCH X/Y].
> > Indeed, the 1/3, 2/3 and 3/3 in your patches don't make sense: your
> > patches are patches 7, 8 and 9! To avoid this, in Buildroot, we have
> > decided to not add numbering inside the patches themselves.
> >   
> 
> Maybe it would make sense to add the '-N' to the example command-lines
> in the manual ? ;) ( That would be section 21.5.2 and 21.5.4)

No, because those sections are about formatting patches for Buildroot,
not patches for packages.

But it should indeed be explained somewhere in the manual, i.e in
https://buildroot.org/downloads/manual/manual.html#patch-policy.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
