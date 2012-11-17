From: Juha Lumme <juha.lumme@gmail.com>
Date: Sat, 17 Nov 2012 20:45:09 +0900
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <20121117123531.431cbd65@skate>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
 <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
 <20121117123531.431cbd65@skate>
Message-ID: <CAF-Ht3zwxboYWZ6Q3ocMtFaAnQ9xEo+qfWfSsovdZuZa3sotkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tomas,

The board boots from memory card currently, and I tarball the output/target
directory and then decompress to the second partition on the memory card.
This worked for a full 250MB debian file system, so I'm assuming it should
work here as well..?

Thanks,
Juha
On Nov 17, 2012 8:35 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Juha Lumme,
>
> On Sat, 17 Nov 2012 20:07:28 +0900, Juha Lumme wrote:
>
> > My reference is Olinuxino maxi, made by Olimex. It's running Freescales
> > i.mx233.
>
> Ok.
>
> > Regarding the inittab and getty configuuration; Actually, that is a copy
> > paste error for some reason there is a hash in there. In the inittab,
> that
> > line is not commented out.
>
> Ok.
>
> > I didn't compile kernel with buildroot, since kernel requires couple
> > patches, and also the sources are downloaded from freescale, not
> kernel.org(
> >
> https://github.com/koliqi/imx23-olinuxino/blob/master/Building%20a%20kernel%20%20for%20the%20OLinuXino.md
> >  ).
>
> Ok. It is most likely possible to get this kernel built with Buildroot,
> but let's compile it separately first and get it working this way.
>
> > I'm not that proficient with buildroot (or building kernels) that I know
> > how to enable buildroot to compile this "custom kernel".. Do you see this
> > making my life much more difficult if I compile kernel separately ?
>
> No.
>
> > I checked my kernel config, and it seems it has this flag enabled:
> > CONFIG_DEVTMPFS=y
> > However: # CONFIG_DEVTMPFS_MOUNT is not set
> >
> > In buildroot, I didn't change the /dev management, so it's currently set
> as
> > "static using device table". I guess there is a mismatch now..
>
> If you're using "static using device table", then CONFIG_DEVTMPFS=y is
> not needed, but it's harmless to have it.
>
> How do you install your root filesystem on the target?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121117/d6144afc/attachment.html>
