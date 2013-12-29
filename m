From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 17:34:59 +0100
Subject: [Buildroot] [PATCH 5/9] linux: enable initrd/initramfs support
 when cpio rootfs is chosen
In-Reply-To: <20131229111336.0242c913@skate>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131228194924.GJ3373@free.fr> <20131229111336.0242c913@skate>
Message-ID: <20131229163459.GA3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-29 11:13 +0100, Thomas Petazzoni spake thusly:
> On Sat, 28 Dec 2013 20:49:24 +0100, Yann E. MORIN wrote:
> 
> > Do we even want to expose cpio in the first place?
> > 
> > The way I see it:
> >   - if someone wants an archive, then a tarball is a more common archive
> >     type than cpio is, so we need not expose cpio. If the user wants an
> >     archive, then he should just use a tarball.
> >   - thus, as cpio is just a requirement for initramfs, there is no
> >     reason to expose cpio in the menu, and just merge cpio as a internal
> >     step of initramfs
> 
> I am using the cpio format, exposed by Buildroot, on a daily basis. My
> use case is that I do a lot of kernel development. I do use Buildroot
> to generate a rootfs.cpio, but I build my kernel separately (because
> I'm rebuilding it many 50-100 times a day). And I simply point my
> kernel configuration to the Buildroot rootfs.cpio:
> 
> ~/projets/marvell/mvebu$ grep INITRAMFS_SOURCE .config
> CONFIG_INITRAMFS_SOURCE="../rootfs-armv7/images/rootfs.cpio"
> 
> So yes, I *really* want to keep the cpio format option :-)

Ah, OK, that's indeed a valid use-case. I had forgotten about
externally-built kernels.

But then, unless you're building without modules, you'd have to rebuild
your rootfs.cpio everytime you rebuild your kernel, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
