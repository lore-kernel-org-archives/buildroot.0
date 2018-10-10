From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Wed, 10 Oct 2018 15:13:57 +0100
Subject: [Buildroot] [PATCH v2] manual: add QEMU demo to quick start
In-Reply-To: <20181010103308.0f204999@windsurf>
References: <20181010075021.749-1-ciro.santilli@gmail.com>
 <20181010103308.0f204999@windsurf>
Message-ID: <CAFXrp_e8G42Z7BxcseGTVYQAvsgebg343XisY6NqTjpMciNtOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2018 at 9:33 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 10 Oct 2018 08:50:21 +0100, Ciro Santilli wrote:
> > ---
>
> We need patches to have a Signed-off-by.
>
> > +=== Try it out with QEMU
> >
> > -From the buildroot directory, run
> > +If you just want to emulate a simple generic QEMU system to see
> > +Buildroot at work immediately, run from the buildroot directory:
> > +
> > +--------------------
> > +make qemu_x86_64_defconfig
> > +make BR2_JLEVEL="$(nproc)"
> > +qemu-system-x86_64 \
> > +  -M pc \
> > +  -kernel output/images/bzImage \
> > +  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> > +  -append "root=/dev/vda" \
> > +  -net nic,model=virtio \
> > +  -net user
> > +--------------------
>
> We should point the user to board/qemu/x86-64/readme.txt instead.
>

Ah, now I understood this comment! I was confused because my previous
patch referred to the wrong board/qemu/x86/readme.txt instead of
x86_64, I thought it was meant to fix that, but it is on another line.

> Perhaps, we could make this a bit more generic, and point to all
> defconfigs and the associated readme.txt files ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
