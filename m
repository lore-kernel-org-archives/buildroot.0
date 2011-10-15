From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 15 Oct 2011 16:06:32 -0500
Subject: [Buildroot] buildroot noob help!
In-Reply-To: <CAEYzJUHho5fwzEks9d67i3dGc8BhEpH09kGr-icoa5LeRgT=uw@mail.gmail.com>
References: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
 <CAEYzJUHho5fwzEks9d67i3dGc8BhEpH09kGr-icoa5LeRgT=uw@mail.gmail.com>
Message-ID: <201110151606.35102.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat October 15 2011, Bj?rn Forsman wrote:
> On 15 October 2011 22:12, Jed Evnull <jedevnull@gmail.com> wrote:
> > I need to compile packages for arm with uclibc and statically link them. Am
> > I selecting the right tool with buildroot?
> 
> I haven't done static linking with Buildroot. Is your reason for wanting static
> linking that you will not use the rest of the rootfs Buildroot gives you?
> 
> > I compiled? buildroot-2011.08
> > with qemu_arm_versatile_defconfig.? The generated cross-compiler compiles
> > simple hello world programs w/o problems, but fails with typical autoconf
> > source packages.
> 
> How did you try to build those packages? You will probably have most success
> if you integrate the package in Buildroot. This is done by (typically)
> writing two
> small files in packages/<yourpackage>/. See the buildroot docs for the details.
> 
> > I tried to chroot into the generated image (chroot myimage /bin/sh --login)
> > to compile from there, but chroot fails with /bin/sh not found.
>

???

If your __not__ building on non-ARM, why do you need a cross-compiler?

If you __are__ building on non-ARM, how did you expect your host 
machine to execute the ARM binaries inside of the chroot?

Me-thinks you need QEMU or such like to do that.

Mike 
> AFAIK, few people use Buildroot to build a compiler into the rootfs,
> so this is not
> that well supported. It's better to use Buildroot as a cross-compile system, not
> native-compile.
> 
> Best regards,
> Bj?rn Forsman
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
