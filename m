From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Nov 2014 22:29:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: disable on nios2
In-Reply-To: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141129212951.GA8477@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-29 19:56 +0100, Bernd Kuhls spake thusly:
> minidlna triggers the _gp bug:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/77875/
> 
> "Fixes"
> http://autobuild.buildroot.net/results/712/71230ee530a41b3611cd4526f0f010f9c2ef25eb/
> http://autobuild.buildroot.net/results/79c/79cbae4dab3ad712bc20c752fdd91e168eade9fe/
> http://autobuild.buildroot.net/results/df7/df7da91985a7bf2b05093bae7379ef22362a44fc/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/minidlna/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
> index 5c5306d..c0620d5 100644
> --- a/package/minidlna/Config.in
> +++ b/package/minidlna/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_MINIDLNA
>  	select BR2_PACKAGE_LIBJPEG
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> +	# Triggers the _gp link issue
> +	depends on !BR2_nios2
>  	help
>  	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
>  	  fully compliant with DLNA/UPnP-AV clients.
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
