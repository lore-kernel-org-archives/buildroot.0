From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 18:31:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: update musl
 related cleanup
In-Reply-To: <20210125013329.31989-1-petr.vorel@gmail.com>
References: <20210125013329.31989-1-petr.vorel@gmail.com>
Message-ID: <20210126173130.GW2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2021-01-25 02:33 +0100, Petr Vorel spake thusly:
> Compile getdents0{1,2}.c which has been fixed in upstream in commit
> 8a85a2d61 ("getdents: update to the new api, don't mix libc and kernel
> types").
> 
> Fixes: 84968aa495 ("package/ltp-testsuite: bump version to 20210121")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 577fdf1131..4d7aa451b5 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -75,8 +75,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
>  	testcases/kernel/syscalls/confstr/confstr01.c \
>  	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
>  	testcases/kernel/syscalls/getcontext/getcontext01.c \
> -	testcases/kernel/syscalls/getdents/getdents01.c \
> -	testcases/kernel/syscalls/getdents/getdents02.c \
>  	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
>  	testcases/kernel/syscalls/timer_create/timer_create01.c \
>  	testcases/kernel/syscalls/timer_create/timer_create03.c \
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
