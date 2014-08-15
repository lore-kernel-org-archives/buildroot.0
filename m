From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 22:46:42 +0200
Subject: [Buildroot] [PATCH v4 1/4] cairo: Add dependency on atomic
 intrinsics
In-Reply-To: <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <CAAXf6LURyGxEfQR+3g6xriwqUeE1E91Oav2X=r_C3YD66JzpEA@mail.gmail.com>
 <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140815204642.GB25897@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anton, All,

On 2014-08-08 19:09 +0400, Anton Kolesov spake thusly:
> Cairo requires GCC built-in atomic functions which are architecture specific
> and may not be implemented.
> 
> This fixes:
> http://autobuild.buildroot.net/results/fadfaa9916724d310d0dda555a1db31bee1601d0/
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, a small comment, unrelated to your change...

[--SNIP--]
> diff --git a/package/webkit/Config.in b/package/webkit/Config.in
> index b7f903c..f42a96f 100644
> --- a/package/webkit/Config.in
> +++ b/package/webkit/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_WEBKIT
>  	depends on BR2_PACKAGE_LIBGTK2
>  	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # icu
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	select BR2_PACKAGE_CAIRO_PNG

This should also 'select BR2_PACKAGE_CAIRO' but that's not the fault of
your patch.

I'll send a fix for that shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
