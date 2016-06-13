From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:46:53 +0200
Subject: [Buildroot] [PATCH 5/6] docs/manual/known-issues: remove
 occurrences of eglibc
In-Reply-To: <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160613204653.GG3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-08 23:40 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see an unrelated comment below...

> ---
>  docs/manual/known-issues.txt | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> index 38ba941..acfe4ff 100644
> --- a/docs/manual/known-issues.txt
> +++ b/docs/manual/known-issues.txt
> @@ -14,18 +14,18 @@
>    DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
>    UCLIBC_SV4_DEPRECATED are needed if one wants to build the
>    +ltp-testsuite+ package with uClibc. You need to either use a glibc
> -  or eglibc based toolchain, or enable the appropriate options in the
> -  uClibc configuration.
> +  based toolchain, or enable the appropriate options in the uClibc
> +  configuration.
>  
>  * The +xfsprogs+ package does not build with the default uClibc
>    configuration used by the Buildroot toolchain backend. You need to
> -  either use a glibc or eglibc based toolchain, or enable the
> -  appropriate options in the uClibc configuration.
> +  either use a glibc based toolchain, or enable the appropriate
> +  options in the uClibc configuration.
>  
>  * The +mrouted+ package does not build with the default uClibc
>    configuration used by the Buildroot toolchain backend. You need to
> -  either use a glibc or eglibc based toolchain, or enable the
> -  appropriate options in the uClibc configuration.
> +  either use a glibc based toolchain, or enable the appropriate
> +  options in the uClibc configuration.

I just discovered we had a konwn-problems section in the manual... That
worries me somewhat: it will be hard to ensure this stays current with
the new versions of those packages...

Are we sure those are still valid? For example. mrouted has been updated
once since the known-issue was added; xfsprogs has been updated twice.

Regards,
Yann E. MORIN.

>  * The +libffi+ package is not supported on the SuperH 2 and ARC
>    architectures.
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
