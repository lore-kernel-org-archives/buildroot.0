From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 16:22:40 +0200
Subject: [Buildroot] why there are errors compiling the kernel, 3.16.7
In-Reply-To: <CAKKWdtdUN=FxONoqC5qMdJZPQjFFeosehRdLnY-b1jq_msU02Q@mail.gmail.com>
References: <CAKKWdtdUN=FxONoqC5qMdJZPQjFFeosehRdLnY-b1jq_msU02Q@mail.gmail.com>
Message-ID: <552296B0.4030808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 15:57, ali hagigat wrote:
> linux-3.16.7.tar.xz
> ipipe-core-3.16.7-arm-5.patch  + xenomai user space applications and libraries
> target-board: wandboard-quad
> 
> 
>   CHK     include/generated/compile.h
>   CC      arch/arm/xenomai/hal.o
>   CC      net/socket.o
>   AS      arch/arm/xenomai/switch.o
> arch/arm/xenomai/hal.c:47:24: fatal error: asm/system.h: No such file
> or directory
>  #include <asm/system.h>

 That file has been deleted in 3.15, so I guess Xenomai is not compatible with
3.16 kernels, or you need a different xenomai version.

 Regards,
 Arnout

>                         ^
> compilation terminated.
> make[2]: *** [arch/arm/xenomai/hal.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [arch/arm/xenomai] Error 2
> make[1]: *** Waiting for unfinished jobs....
>   LD      net/802/built-in.o
>   CC      net/core/sock.o
>   CC      net/dns_resolver/dns_key.o
>   CC      net/dns_resolver/dns_query.o
>   LD      net/dns_resolver/dns_resolver.o
>   LD      net/dns_resolver/built-in
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
