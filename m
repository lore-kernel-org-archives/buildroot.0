From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 16:34:16 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as
 contact for galileo_defconfig
In-Reply-To: <MN2PR11MB4160005AC798211088F160C090210@MN2PR11MB4160.namprd11.prod.outlook.com>
References: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
 <20191231152005.GH26395@scaer>
 <MN2PR11MB4160005AC798211088F160C090210@MN2PR11MB4160.namprd11.prod.outlook.com>
Message-ID: <20200101163416.065d0ace@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jan 2020 11:11:53 +0000
"Kinsella, Ray" <ray.kinsella@intel.com> wrote:

> My buildroot skills are bit rusty, but I have been mean to dust them off.
> So I am  willing to give it a go.
> 
> BTW is there a specific failure that is causing a problem at the moment.
> I have grub failing on what look to be Unicode related issues.
>  
> /build/buildroot/output/host/lib/gcc/i586-buildroot-linux-uclibc/8.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: grub-core/lib/gnulib/libgnu.a(mbrtowc.o): in function `mbrtowc':
> mbrtowc.c:(.text+0x169): undefined reference to `mbtowc'
> /build/buildroot/output/host/lib/gcc/i586-buildroot-linux-uclibc/8.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: mbrtowc.c:(.text+0x17a): undefined reference to `mbtowc'
> /build/buildroot/output/host/lib/gcc/i586-buildroot-linux-uclibc/8.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: grub-core/lib/gnulib/libgnu.a(vasnprintf.o): in function `vasnprintf':
> vasnprintf.c:(.text+0x566): undefined reference to `wctomb'

Could you try enabling BR2_TOOLCHAIN_BUILDROOT_WCHAR and do a full
rebuild? Maybe we're missing this dependency in the grub package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
