From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 12:57:33 +0200
Subject: [Buildroot] [PATCH 1/2] scripts/graph-build-time: clarify
	backend selection
In-Reply-To: <1413111142-17643-1-git-send-email-luca@lucaceresoli.net>
References: <1413111142-17643-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20141012105733.GC3870@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-10-12 12:52 +0200, Luca Ceresoli spake thusly:
> This instruction in the middle of 'import' lines looks very strange.
> 
> Also, it was not obvious to me what the 'Agg' backend is.
> 
> Both things are actually correct, but it took a while to find out why.
> So clarify with a comment to save someone else's time.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Sascha Arthur <sascha.arthur@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Except for a little typo:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  support/scripts/graph-build-time | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
> index 4bb90c2..b2817bd 100755
> --- a/support/scripts/graph-build-time
> +++ b/support/scripts/graph-build-time
> @@ -52,7 +52,12 @@
>  import matplotlib as mpl
>  import numpy
>  
> +# Use the Agg backend (which produces a PNG output, see
> +# http://matplotlib.org/faq/usage_faq.html#what-is-a-backend),
> +# otherwise an incorrect backend is used on soe host machines).

s/soe/smoe/

Regards,
Yann E. MORIN.

> +# Note: matplotlib.use() must be called *before* matplotlib.pyplot.
>  mpl.use('Agg')
> +
>  import matplotlib.pyplot as plt
>  import matplotlib.font_manager as fm
>  import csv
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
