From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 19:38:37 +0100
Subject: [Buildroot] [PATCH 04/21] docs/manual: document usage of
 BR2_TOOLCHAIN_HAS_SYNC_x
In-Reply-To: <1453676887-31236-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125183837.GE3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> This commit updates the documentation to detail when and how to use
> the BR2_TOOLCHAIN_HAS_SYNC_x dependency. Note that we chose to not add
> a comment about this dependency, because it is mainly tied to
> architecture capabilities (except in very specific cases, which would
> be way too complicated to explain in a Config.in comment).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-directory.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index b9596a2..cd78390 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -279,6 +279,19 @@ use in the comment.
>  ** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
>  ** Comment string: no comment to be added
>  
> +* Gcc +__sync_*+ built-ins used for atomic operations. They are
> +  available in variants operating on 1 byte, 2 bytes, 4 bytes and 8
> +  bytes. Since different architectures support atomic operations on
> +  different sizes, one dependency symbol is available for each size:
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_SYNC_1+ for 1 byte,
> +   +BR2_TOOLCHAIN_HAS_SYNC_2+ for two bytes,
> +   +BR2_TOOLCHAIN_HAS_SYNC_4+ for 4 bytes, +BR2_TOOLCHAIN_HAS_SYNC_8+
> +   for 8 bytes.
> +** Comment string: no comment to be added
> +
> +* One byte +__sync_*+ gcc built-in for atomic instructions
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_SYNC_1+

I don't see why you specifically documment BR2_TOOLCHAIN_HAS_SYNC_1
separately. Did I miss something, or is it a stray attempt?

Regards,
Yann E. MORIN.

>  * Kernel headers
>  ** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
>     +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> -- 
> 2.6.4
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
