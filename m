From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 15:39:41 +0200
Subject: [Buildroot] [External] Re: [RFC for-next] package/gcc: enable
 secureplt for powerpc64
In-Reply-To: <DM2P110MB0105B155ACA31AA8A810187EF22C9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210517201327.755689-1-romain.naour@gmail.com>
 <20210518120543.GC2506@scaer>
 <DM2P110MB0105B155ACA31AA8A810187EF22C9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <20210518133941.GO2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-05-18 13:20 +0000, Weber, Matthew L Collins via buildroot spake thusly:
> > -----Original Message-----
> > From: Yann E. MORIN <yann.morin.1998@free.fr>
> > Sent: Tuesday, May 18, 2021 7:06 AM
> > To: Romain Naour <romain.naour@gmail.com>
> > Cc: buildroot at buildroot.org; Weber, Matthew L Collins
> > <Matthew.Weber@collins.com>
> > Subject: [External] Re: [Buildroot] [RFC for-next] package/gcc: enable
> > secureplt for powerpc64
> > 
> > Romain, All,
> > 
> > On 2021-05-17 22:13 +0200, Romain Naour spake thusly:
> > > GCC support enabling secureplt for powerpc64.
> > >
> > > From [1]
> > > "PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
> > > runtime code generation to generate the PLT stubs. Secure-PLT was
> > > introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
> > > Binutils 2.17), and is a more secure PLT format, using a read-only
> [snip]
> > > linkage table, with the dynamic linker populating a non-executable
> > > index table."
> Interestingly, when doing SElinux policy, we didn't observe similar
> behavior with memory execute requests on PowerPC64 vs PowerPC. Without
> this option, we observed regular memory execute (access request)
> audits on PowerPC, and we couldn't cleanly write policy without really
> opening things up.
> > > This option is always enabled by glibc testing script called
> > > build-many-glibcs.py [1]. This script exist since glibc 2.25.
> > >
> > > Runtime tested with qemu_ppc64_e5500_defconfig.
> > 
> > Good enough for me.
> Agree, the runtime test in QEMU should cover any lack of hardware
> testing.  I've successfully moved kernels between emulation and
> devkits for this arch.
> 
> Reviewed-by: Matt Weber <matthew.weber@collins.com>

Already applied, so your rev-tag will not be recorded, sorry... But
still, this is good to read a positive feedback nonetheless. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
