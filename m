From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Tue, 18 May 2021 13:20:38 +0000
Subject: [Buildroot] [External] Re: [RFC for-next] package/gcc: enable
 secureplt for powerpc64
In-Reply-To: <20210518120543.GC2506@scaer>
References: <20210517201327.755689-1-romain.naour@gmail.com>
 <20210518120543.GC2506@scaer>
Message-ID: <DM2P110MB0105B155ACA31AA8A810187EF22C9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Tuesday, May 18, 2021 7:06 AM
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot at buildroot.org; Weber, Matthew L Collins
> <Matthew.Weber@collins.com>
> Subject: [External] Re: [Buildroot] [RFC for-next] package/gcc: enable
> secureplt for powerpc64
> 
> Romain, All,
> 
> On 2021-05-17 22:13 +0200, Romain Naour spake thusly:
> > GCC support enabling secureplt for powerpc64.
> >
> > From [1]
> > "PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
> > runtime code generation to generate the PLT stubs. Secure-PLT was
> > introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
> > Binutils 2.17), and is a more secure PLT format, using a read-only
[snip]
> > linkage table, with the dynamic linker populating a non-executable
> > index table."

Interestingly, when doing SElinux policy, we didn't observe similar behavior with memory execute requests on PowerPC64 vs PowerPC.  Without this option, we observed regular memory execute (access request) audits on PowerPC, and we couldn't cleanly write policy without really opening things up.

> >
> > This option is always enabled by glibc testing script called
> > build-many-glibcs.py [1]. This script exist since glibc 2.25.
> >
> > Runtime tested with qemu_ppc64_e5500_defconfig.
> 
> Good enough for me.

Agree, the runtime test in QEMU should cover any lack of hardware testing.  I've successfully moved kernels between emulation and devkits for this arch.

Reviewed-by: Matt Weber <matthew.weber@collins.com>
