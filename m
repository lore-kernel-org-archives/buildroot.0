From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:37:26 +0200
Subject: [Buildroot] [PATCH] jQuery: introduce external plugin menu
In-Reply-To: <1438804910-13071-1-git-send-email-yegorslists@googlemail.com>
References: <1438804910-13071-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150806083726.7fc7af78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Wed,  5 Aug 2015 22:01:50 +0200, Yegor Yefremov wrote:
> List all jQuery plugins in a dedicated menu and remove
> uneeded jQuery selection.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I'm fine with the principle, but I have some comments (see below);

> diff --git a/package/jquery-datetimepicker/Config.in b/package/jquery-datetimepicker/Config.in
> index 6a07ec3..ae101ca 100644
> --- a/package/jquery-datetimepicker/Config.in
> +++ b/package/jquery-datetimepicker/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_JQUERY_DATETIMEPICKER
> -	bool "jquery-datetimepicker"
> -	select BR2_PACKAGE_JQUERY
> +	bool "jQuery-datetimepicker"

Please keep the lowercase name. I'd prefer to see the packages that do
not conform to this principle to be changed to lowercase, rather than
the opposite.

>  	help
>  	  Use this plugin to unobtrusively add a datetimepicker,
>  	  datepicker or timepicker dropdown to your forms.
> diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
> index e44193e..3f7a486 100644
> --- a/package/jquery-keyboard/Config.in
> +++ b/package/jquery-keyboard/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_JQUERY_KEYBOARD
>  	bool "jQuery keyboard"

Change to lower-case.

> -	select BR2_PACKAGE_JQUERY
>  	select BR2_PACKAGE_JQUERY_UI
>  	help
>  	  Virtual Keyboard using jQuery UI
> diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
> index fa31a36..b9d632f 100644
> --- a/package/jquery-mobile/Config.in
> +++ b/package/jquery-mobile/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_JQUERY_MOBILE
> -	bool "jquery-mobile"
> +	bool "jQuery-mobile"

Keep lowercase.

etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
