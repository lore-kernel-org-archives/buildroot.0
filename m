From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 15 Oct 2011 22:53:20 +0200
Subject: [Buildroot] buildroot noob help!
In-Reply-To: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
References: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
Message-ID: <CAEYzJUHho5fwzEks9d67i3dGc8BhEpH09kGr-icoa5LeRgT=uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 October 2011 22:12, Jed Evnull <jedevnull@gmail.com> wrote:
> I need to compile packages for arm with uclibc and statically link them. Am
> I selecting the right tool with buildroot?

I haven't done static linking with Buildroot. Is your reason for wanting static
linking that you will not use the rest of the rootfs Buildroot gives you?

> I compiled? buildroot-2011.08
> with qemu_arm_versatile_defconfig.? The generated cross-compiler compiles
> simple hello world programs w/o problems, but fails with typical autoconf
> source packages.

How did you try to build those packages? You will probably have most success
if you integrate the package in Buildroot. This is done by (typically)
writing two
small files in packages/<yourpackage>/. See the buildroot docs for the details.

> I tried to chroot into the generated image (chroot myimage /bin/sh --login)
> to compile from there, but chroot fails with /bin/sh not found.

AFAIK, few people use Buildroot to build a compiler into the rootfs,
so this is not
that well supported. It's better to use Buildroot as a cross-compile system, not
native-compile.

Best regards,
Bj?rn Forsman
