From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 12:35:31 +0100
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
 <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
Message-ID: <20121117123531.431cbd65@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Juha Lumme,

On Sat, 17 Nov 2012 20:07:28 +0900, Juha Lumme wrote:

> My reference is Olinuxino maxi, made by Olimex. It's running Freescales
> i.mx233.

Ok.

> Regarding the inittab and getty configuuration; Actually, that is a copy
> paste error for some reason there is a hash in there. In the inittab, that
> line is not commented out.

Ok.

> I didn't compile kernel with buildroot, since kernel requires couple
> patches, and also the sources are downloaded from freescale, not kernel.org(
> https://github.com/koliqi/imx23-olinuxino/blob/master/Building%20a%20kernel%20%20for%20the%20OLinuXino.md
>  ).

Ok. It is most likely possible to get this kernel built with Buildroot,
but let's compile it separately first and get it working this way.

> I'm not that proficient with buildroot (or building kernels) that I know
> how to enable buildroot to compile this "custom kernel".. Do you see this
> making my life much more difficult if I compile kernel separately ?

No.

> I checked my kernel config, and it seems it has this flag enabled:
> CONFIG_DEVTMPFS=y
> However: # CONFIG_DEVTMPFS_MOUNT is not set
> 
> In buildroot, I didn't change the /dev management, so it's currently set as
> "static using device table". I guess there is a mismatch now..

If you're using "static using device table", then CONFIG_DEVTMPFS=y is
not needed, but it's harmless to have it.

How do you install your root filesystem on the target?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
