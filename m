From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Aug 2015 21:58:58 +0200
Subject: [Buildroot] [PATCH 4/9] docs/manual: document gcc version
 dependencies
In-Reply-To: <1438711241-31792-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150804195858.GW3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-04 20:00 +0200, Thomas Petazzoni spake thusly:
> This commit updates the Buildroot manual to document how to detail the
> gcc version dependencies in Config.in comments of packages, like we do
> for kernel headers version.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see a comment below...

> ---
>  docs/manual/adding-packages-directory.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 8f585d4..b66e447 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -277,6 +277,12 @@ use in the comment.
>  ** Comment string: +headers >= X.Y+ and/or `headers <= X.Y` (replace
>     +X.Y+ with the proper version)
>  
> +* GCC version
> +** Dependency symbol: +BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y+, (replace
> +   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> +** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace

One of the condition is between ++ and the other between ``. I konow you
just replicated what was done for the kernel headers, but wuld it not be
better to use only ++ (or only ``, I don't mind) but not both?

And fix the kernel one@the same time, maybe (or in a separate patch)?

Regards,
Yann E. MORIN.

> +   +X.Y+ with the proper version)
> +
>  * C library
>  ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
>     +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
> -- 
> 2.5.0
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
