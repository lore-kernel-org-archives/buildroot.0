From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Mar 2014 06:16:18 +0200
Subject: [Buildroot] ARC/uclibc-f37101d94284c692ee9b23bc72ef38b9473cd316
 compile failure
In-Reply-To: <trinity-2154b334-ea3f-48a7-ad1d-15cc3890166f-1395356198737@3capp-gmx-bs24>
References: <trinity-2154b334-ea3f-48a7-ad1d-15cc3890166f-1395356198737@3capp-gmx-bs24>
Message-ID: <20140321041618.GO4266@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Mar 20, 2014 at 11:56:38PM +0100, Peter Seiderer wrote:
> with latest buildroot from git I get the following uclib compile failure.
> 
> Buildroot defconfig:
> 
> BR2_arceb=y
> 
> Build log:
> ...
>   CC libc/sysdeps/linux/common/getpgid.os
>   CC libc/sysdeps/linux/common/modify_ldt.os
>   CC libc/sysdeps/linux/common/posix_fadvise.os
> libc/sysdeps/linux/common/posix_fadvise.c:26:29: error: unknown type name 'off64_t'
>  int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
>                              ^
> libc/sysdeps/linux/common/posix_fadvise.c:26:45: error: unknown type name 'off64_t'
>  int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
>                                              ^
> libc/sysdeps/linux/common/posix_fadvise.c: In function 'posix_fadvise':
> libc/sysdeps/linux/common/posix_fadvise.c:32:2: warning: implicit declaration of function 'posix_fadvise64' [-Wimplicit-function-declaration]
>   return posix_fadvise64(fd, offset, len, advice);
>   ^
> make[2]: *** [libc/sysdeps/linux/common/posix_fadvise.os] Error 1
> make[1]: *** [/home/seiderer/Work/zeiss/freescale-imx6/build_arc/build/uclibc-f37101d94284c692ee9b23bc72ef38b9473cd316/.stamp_built] Error 2
> make: *** [_all] Error 2

Do you have LFS support disabled? If so this is a known issue. You may try the 
patch at http://thread.gmane.org/gmane.comp.lib.uclibc.general/23714 .

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
