From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 22:09:06 +0200
Subject: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
In-Reply-To: <20210510180049.61421-4-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com>
Message-ID: <20210517200906.GE2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, All,

On 2021-05-10 11:00 -0700, Vineet Gupta via buildroot spake thusly:
> otherwise memsize bails out and erroneously reports 1 MB
> 
> NOK
> ----
> | />/lmbench/bin/arc/memsize 16
> |
> | 1
> 
> OK
> ---

This triple-dash line is the usual git marker to end the actual commit
log, so everything below was dropped when applying the patch with git-am.
I've fixed that, and applied to master, thanks.

However, I wonder how relevant lmbench is nowadays. Indeed, there has
been zero activity on lmbench source code since June 2009, almost 12
years ago now...

Regards,
Yann E. MORIN.

> | />/lmbench/bin/arc/memsize 16
> | 2MB OK3MB OK4MB OK5MB OK6MB OK7MB OK8MB OK9MB OK10MB OK11MB OK12MB OK13MB OK14MB OK15MB OK16MB OK
> | 16
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
> 
> diff --git a/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
> new file mode 100644
> index 000000000000..6c3e7370e11b
> --- /dev/null
> +++ b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
> @@ -0,0 +1,28 @@
> +From d85b61666aa2728f68b69d02bfb162c432df709f Mon Sep 17 00:00:00 2001
> +From: vgupta <vgupta@4eed8e25-bc12-0410-818a-f70ee6866280>
> +Date: Sat, 3 Mar 2012 10:02:24 +0000
> +Subject: [PATCH] TOO_LONG 100 usec to prevent memsize from timingout @80Mhz
> +
> +git-svn-id: http://sjvm-subversion02.internal.synopsys.com/svn/OSS/ARC_Linux/tests/lmbench-3.0-a9 at 157318 4eed8e25-bc12-0410-818a-f70ee6866280
> +
> +Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> +---
> + src/memsize.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/memsize.c b/src/memsize.c
> +index eb25a0924872..b333cf8cbd32 100644
> +--- a/src/memsize.c
> ++++ b/src/memsize.c
> +@@ -15,7 +15,7 @@ char	*id = "$Id$\n";
> + #define	CHK(x)	if ((x) == -1) { perror("x"); exit(1); }
> + 
> + #ifndef	TOO_LONG
> +-#define	TOO_LONG	10	/* usecs */
> ++#define	TOO_LONG	100	/* usecs */
> + #endif
> + 
> + int	alarm_triggered = 0;
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
