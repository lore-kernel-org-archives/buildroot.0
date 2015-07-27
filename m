From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:34:50 +0200
Subject: [Buildroot] [PATCH] jquery-datetimepicker: new package
In-Reply-To: <1438022252-8024-1-git-send-email-yegorslists@googlemail.com>
References: <1438022252-8024-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150727223450.16eac5ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Mon, 27 Jul 2015 20:37:32 +0200, Yegor Yefremov wrote:
> Introduce jQuery submenu for jQuery plugins.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                      |  5 +++++
>  package/jquery-datetimepicker/Config.in                |  7 +++++++
>  package/jquery-datetimepicker/jquery-datetimepicker.mk | 18 ++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/jquery-datetimepicker/Config.in
>  create mode 100644 package/jquery-datetimepicker/jquery-datetimepicker.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f029e1d..f240c26 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -882,6 +882,11 @@ menu "Javascript"
>  	source "package/explorercanvas/Config.in"
>  	source "package/flot/Config.in"
>  	source "package/jquery/Config.in"
> +if BR2_PACKAGE_JQUERY
> +menu "external jQuery plugins"
> +	source "package/jquery-datetimepicker/Config.in"
> +endmenu
> +endif

I'm not happy with this change: there are already other jquery plugins
below:

>  	source "package/jquery-keyboard/Config.in"
>  	source "package/jquery-mobile/Config.in"
>  	source "package/jquery-sparkline/Config.in"

So, what I'd prefer is to have two patches:

 */ One adding the jquery-datetimepicker package

 */ One moving all jquery plugins to a sub-menu

Can you rework with this idea in mind?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
