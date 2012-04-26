From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Thu, 26 Apr 2012 16:08:40 +0200
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <1335435324-18792-2-git-send-email-gustavo@zacarias.com.ar>
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <1335435324-18792-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120426140840.GJ20601@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07:15 Thu 26 Apr     , Gustavo Zacarias wrote:
> Since busybox 1.20+ includes a lsof applet make sure lsof gets built
> after busybox so that we get the full-blown version if both are enabled.
> Also hide the lsof package unless BUSYBOX_SHOW_OTHERS is true.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in    |    2 ++
>  package/lsof/lsof.mk |    3 +++
>  2 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 64fce62..7f9b234 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -24,7 +24,9 @@ source "package/dmalloc/Config.in"
>  source "package/kexec/Config.in"
>  source "package/latencytop/Config.in"
>  source "package/lmbench/Config.in"
> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/lsof/Config.in"
put a depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS


in lsof/Config.in

Best Regards,
J.
