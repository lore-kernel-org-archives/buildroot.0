From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Fri, 21 May 2021 10:59:01 +0000
Subject: [Buildroot] [External] Re: [PATCH/NEXT: 00/11] selinux
 packages: bump versions
In-Reply-To: <20210521100632.GJ3208066@scaer>
References: <20210520174649.1188340-1-aduskett@gmail.com>,
 <20210521100632.GJ3208066@scaer>
Message-ID: <DM2P110MB0105A9D9DE2A48B511681BECF2299@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Friday, May 21, 2021 5:06 AM
> To: Adam Duskett <aduskett@gmail.com>
> Cc: buildroot at buildroot.org <buildroot@buildroot.org>; Marcus Folkesson <marcus.folkesson@gmail.com>; Antoine Tenart <atenart@kernel.org>; Shotwell, Clayton L Collins <Clayton.Shotwell@collins.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Subject: [External] Re: [Buildroot] [PATCH/NEXT: 00/11] selinux packages: bump versions
> ?
> Adam, All,
>
> On 2021-05-20 10:46 -0700, Adam Duskett spake thusly:
> > The selinux project also now uses the respective package versions for the
> > release URL's, so we change that as well.
> >
> > Adam Duskett (11):
> >?? package/libsepol: bump to version 3.2
> >?? package/libsepol/Config.in: Add policy version 33
> >?? package/libsemanage: bump to version 3.2
> >?? package/libselinux: bump to version 3.2
> >?? package/policycoreutils: bump to version 3.2
> >?? package/checkpolicy: bump to version 3.2
> >?? package/restorecond: bump to version 3.2
> >?? package/semodule-utils: bump to version 3.2
> >?? package/selinux-python: bump to version 3.2
> >?? package/setools: bump to version 4.4.0
> >?? package/audit: bump to version 3.0.1
>
> Entire series applied to next, thanks.
>
> As discussed on IRC, could you look into either;
>
> ? - increasing the timeout of the selinux tests,
>
> ? - or, better, ensure that we start the qe;u instance with a proper
> ??? virtual HWRNGmm as suggested by Matt and Khem;
> ??? * start qemu with:
> ??????? -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0
> ??? * ensure virtio-rng is built-in to the kernel we use

A pattern for this was merged in the docker compose test (a9219660d30).  However, this test uses the base test 'builtin" kernel. Update steps would roughly be:
1) Update to the qemu_cmd's for "builtin" kernels in support/testing/infra/emulator.py
2) Kernel rebuilds on "builtin" images to support (if CONFIG not already selected) as they are binary downloads for runtest use
3) Rerun of the whole test suite...

So maybe easier to go with option 1 and extend timeouts for now?

Matt
