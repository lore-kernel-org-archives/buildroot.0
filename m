From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jun 2014 21:49:10 +0200
Subject: [Buildroot] [PATCH 1/1] tvheadend: Rebase
 tvheadend-001-no-auto-download-dvbscans.patch
In-Reply-To: <1401738247-29191-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401738247-29191-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140602194910.GD3404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-02 21:44 +0200, Bernd Kuhls spake thusly:
> Fixes http://autobuild.buildroot.net/results/d10/d10b4ebf3c21a55413a30d7ce1cb9ec9790bd9bd/
> 
> Needed since this commit
> https://github.com/tvheadend/tvheadend/commit/a46a6d0dd39db8e3ad546a73c57ece91f92ee5b5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for fixing my mistake.

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
> index f14f302..18bff39 100644
> --- a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
> +++ b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
> @@ -15,7 +15,7 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure tvh
>   #
>   # DVB scan
>   #
> --if enabled linuxdvb && enabled dvbscan; then
> +-if enabled dvbscan; then
>  -  printf "${TAB}" "fetching dvb-scan files ..."
>  -  "${ROOTDIR}/support/getmuxlist"
>  -  if [ $? -ne 0 ]; then
> @@ -25,7 +25,7 @@ diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure tvh
>  -  echo "ok"
>  -fi
>  +# For buildroot, we already installed those files via the dvb-apps package
> -+#if enabled linuxdvb && enabled dvbscan; then
> ++#if enabled dvbscan; then
>  +#  printf "${TAB}" "fetching dvb-scan files ..."
>  +#  "${ROOTDIR}/support/getmuxlist"
>  +#  if [ $? -ne 0 ]; then
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
