From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 2 Jun 2014 09:40:30 +0300
Subject: [Buildroot] simple xtensa build fails
In-Reply-To: <20140602062354.GB4197@waldemar-brodkorb.de>
References: <20140602062354.GB4197@waldemar-brodkorb.de>
Message-ID: <20140602064030.GB4473@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Mon, Jun 02, 2014 at 08:23:54AM +0200, Waldemar Brodkorb wrote:
> a simple Xtensa build fails:
>  CC libc/sysdeps/linux/common/posix_fadvise.os
> libc/sysdeps/linux/common/posix_fadvise.c:26:29: error: unknown type
> name 'off64_t'
> libc/sysdeps/linux/common/posix_fadvise.c:26:45: error: unknown type
> name 'off64_t'
> libc/sysdeps/linux/common/posix_fadvise.c: In function
> 'posix_fadvise':
> libc/sysdeps/linux/common/posix_fadvise.c:32:2: warning: implicit
> declaration of function 'posix_fadvise64'
> [-Wimplicit-function-declaration]
> make[1]: *** [libc/sysdeps/linux/common/posix_fadvise.os] Error 1
> make[1]: Leaving directory
> `/home/wbx/br/output/build/uclibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c'
> make: ***
> [/home/wbx/br/output/build/uclibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c/.stamp_built]
> Error 2

Snapshot uClibc build without LFS is currently broken. See 
http://article.gmane.org/gmane.comp.lib.uclibc.general/23714 for a fix.

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
