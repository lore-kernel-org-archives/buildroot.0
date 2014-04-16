From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Apr 2014 08:04:13 +0300
Subject: [Buildroot] Commit mtd: fix build against uClibc reverted.
In-Reply-To: <5A37E7B54B044CD8883D891AE8478A5D@JohanW7>
References: <AE1A486A4CE04A45B8F2EDE23B563100@JohanW7>
 <5A37E7B54B044CD8883D891AE8478A5D@JohanW7>
Message-ID: <20140416050413.GC4849@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert Johan,

On Tue, Apr 15, 2014 at 02:15:00AM +0200, Sagaert Johan wrote:
> This is the build output with the offending patch.

[...]

>   CC      lib/libmtd.o
> In file included from lib/libmtd.c:40:0:
> ./include/common.h:110:19: error: static declaration of 'rpmatch' follows non-static declaration
>  static inline int rpmatch(const char *resp)
> 
>                    ^
> In file included from lib/libmtd.c:25:0:
> /home/brcpy2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdlib.h:832:12: note: previous declaration of
> 'rpmatch' was here
>  extern int rpmatch (__const char *__response) __THROW __nonnull ((1)) __wur;
>             ^
> make[1]: *** [/home/brcpy2/output/build/mtd-1.5.1/lib/libmtd.o] Error 1
> make[1]: Leaving directory `/home/brcpy2/output/build/mtd-1.5.1'
> make: *** [/home/brcpy2/output/build/mtd-1.5.1/.stamp_built] Error 2

Please try the patch at http://patchwork.ozlabs.org/patch/339368/ .

Thanks,
baruch

> -----Oorspronkelijk bericht-----
> Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Sagaert Johan
> Verzonden: dinsdag 15 april 2014 1:21
> Aan: 'Thomas Petazzoni'
> CC: buildroot at busybox.net
> Onderwerp: [Buildroot] Commit mtd: fix build against uClibc reverted.
>  
> Dear ;
> 
> Commit mtd: fix build against uClibc
> Add a rpmatch() implementation when uClibc is missing one.
> 
> Fixes:
> http://autobuild.buildroot.net/results/171/17187c3c9ba2b9df2bb6ac103e9a54706f07c28b/
> 
> Strange
> I had to revert this commit in my build, it yielded the error in mtd it supposed to fix.
> 
> This patch seems to be intended for uClibc 0.9.34 but it seems to be applied on my 0.9.33.2
> 
> Regards
> Sagaert Johan

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
