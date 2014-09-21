From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 22:25:45 +0200
Subject: [Buildroot] [PATCH 1/1] Removed X depency for make build-graphs
In-Reply-To: <1411317986-793-1-git-send-email-sascha.arthur@gmail.com>
References: <1411317986-793-1-git-send-email-sascha.arthur@gmail.com>
Message-ID: <20140921202545.GA28325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sascha, All,

On 2014-09-21 18:46 +0200, Sascha Arthur spake thusly:
> 
> Signed-off-by: Sascha Arthur <sascha.arthur@gmail.com>

The resulting graphs do not seem to be affected by this change, as far
as I could see with a minimal build.

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

It is a solution I also found suggested on StackOverflow.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/graph-build-time |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
> index 524c30d..4bb90c2 100755
> --- a/support/scripts/graph-build-time
> +++ b/support/scripts/graph-build-time
> @@ -49,9 +49,10 @@
>  #   * argparse (by default in Python 2.7, requires python-argparse if
>  #     Python 2.6 is used)
>  
> -import matplotlib
> +import matplotlib as mpl
>  import numpy
>  
> +mpl.use('Agg')
>  import matplotlib.pyplot as plt
>  import matplotlib.font_manager as fm
>  import csv
> -- 
> 1.7.10.4
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
