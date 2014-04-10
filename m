From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Apr 2014 09:38:17 +0300
Subject: [Buildroot] [PATCH] ne10: bump version to 1.0.0
In-Reply-To: <20140408235152.66df3162@skate>
References: <99baf8d8d8d05b5f2de390deef6546acab0199dd.1396965306.git.baruch@tkos.co.il>
 <20140408235152.66df3162@skate>
Message-ID: <20140410063817.GU4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Apr 08, 2014 at 11:51:52PM +0200, Thomas Petazzoni wrote:
> On Tue,  8 Apr 2014 16:55:06 +0300, Baruch Siach wrote:
> 
> > +-    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
> > ++    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfloat-abi=softfp -mfpu=neon")
> 
> This will not work on hardfp toolchains.

So would depending on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4 be 
sufficient? The toolchain wrappers handles -mfloat-abi/-mfpu, so this patch is 
not needed actually.

BTW, what is BR2_ARM_ENABLE_NEON used for? I couldn't find any reference to 
this configuration symbol in the code.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
