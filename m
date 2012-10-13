From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 13 Oct 2012 11:41:24 +0200
Subject: [Buildroot] [PATCH] webkit: Fix build issue with gcc-4.6 and
	above
In-Reply-To: <1349385964-710-1-git-send-email-gvaxon@gmail.com>
References: <1349385964-710-1-git-send-email-gvaxon@gmail.com>
Message-ID: <CAHXCMMJJXz-EXnSyVyL_=xcXQze=GM__k6sQsm=jSWmEQMheyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Val, all,

Tested using gcc-4.{6,7}-based toolchain.

My comments inlined.

2012/10/4 Valentine Barshak <gvaxon@gmail.com>:
> This fixes the "Unknown parameter for tags/attrs" build error.
> Backported from commit 88e08c43d0200a4b06a298b7d2541965eebc0afe
>
> [PATCH] 2011-04-17  Thierry Reding
> <thierry.reding@avionic-design.de>
>
>   Reviewed by Adam Barth.
>
>   Fix build with GCC 4.6.
>
>   * dom/make_names.pl: Execute preprocessor without the -P option. The
>   preprocessor in GCC 4.6 eats empty lines, effectively breaking the
>   parsing performed by this script. Dropping the -P option when invoking
>   the preprocessor keeps the empty lines but as a side-effect also adds
>   additional linemarkers.
>
>   From the cpp manpage:
>
>     -P  Inhibit generation of linemarkers in the output from the
>         preprocessor. This might be useful when running the preprocessor
>         on something that is not C code, and will be sent to a program
>         which might be confused by the linemarkers.
>
>   The linemarkers are not problematic, however, because the script
>   properly handles them by ignoring all lines starting with a #.
>
> Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

[...]
> +        The linemarkers are not problematic, however, because the script
> +        properly handles them by ignoring all lines starting with a #.
> +
> +diff --git a/WebCore/dom/make_names.pl b/Source/WebCore/dom/make_names.pl
Nitpicking:
s at Source/@@


Regards,

-- 
Sam
