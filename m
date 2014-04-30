From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Wed, 30 Apr 2014 10:07:15 +0000
Subject: [Buildroot] [PATCH v2 1/4] uclibc: arc: bump to arc-4.8-R3
	release
In-Reply-To: <87k3a7tjc5.fsf@dell.be.48ers.dk>
References: <535EA9E5.5010909@mind.be>
 <1398785474-17540-1-git-send-email-Anton.Kolesov@synopsys.com>
 <87k3a7tjc5.fsf@dell.be.48ers.dk>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CC313C@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I've talked with Vineet, and I will send a new uClibc bump-patch that will point to new commit, with this fix applied. 

Anton


> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
> Korsgaard
> Sent: 30 April 2014 10:36
> To: Anton Kolesov
> Cc: buildroot at uclibc.org; Alexey Brodkin
> Subject: Re: [PATCH v2 1/4] uclibc: arc: bump to arc-4.8-R3 release
> 
> >>>>> "Anton" == Anton Kolesov <Anton.Kolesov@synopsys.com> writes:
> 
>  > Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
>  > Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
>  > ---
>  >  package/uclibc/Config.in | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
>  > index 2b93660..cc244a9 100644
>  > --- a/package/uclibc/Config.in
>  > +++ b/package/uclibc/Config.in
>  > @@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
>  >  	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
>  >  	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
>  >  	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
>  > -	default "f37101d94284c692ee9b23bc72ef38b9473cd316" if BR2_arc
>  > +	default "arc-4.8-R3"	if BR2_arc
>  >  	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if
> BR2_UCLIBC_VERSION_XTENSA_GIT
>  >  	default BR2_USE_UCLIBC_SNAPSHOT	if
> BR2_UCLIBC_VERSION_SNAPSHOT
> 
> This is broken for !lfs builds:
> 
>    CC libc/sysdeps/linux/common/posix_fadvise.os
> libc/sysdeps/linux/common/posix_fadvise.c:26:29: error: unknown type
> name 'off64_t'
>  int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
>                              ^
> libc/sysdeps/linux/common/posix_fadvise.c:26:45: error: unknown type
> name 'off64_t'
>  int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
>                                              ^
> libc/sysdeps/linux/common/posix_fadvise.c: In function 'posix_fadvise':
> libc/sysdeps/linux/common/posix_fadvise.c:32:2: warning: implicit
> declaration of function 'posix_fadvise64' [-Wimplicit-function-declaration]
>   return posix_fadvise64(fd, offset, len, advice);
>   ^
> make[1]: *** [libc/sysdeps/linux/common/posix_fadvise.os] Error 1
> make[1]: Leaving directory
> `/home/peko/source/buildroot/output/build/uclibc-arc-4.8-R3'
> make: *** [/home/peko/source/buildroot/output/build/uclibc-arc-4.8-
> R3/.stamp_built] Error 2
> 
> I believe this fixes it:
> 
> http://lists.uclibc.org/pipermail/uclibc/2014-April/048298.html
> 
> --
> Bye, Peter Korsgaard
