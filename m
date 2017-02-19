From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Feb 2017 12:35:16 +0200
Subject: [Buildroot] [PATCH] package/mosquito: needs sync_4
In-Reply-To: <1487499795-2205-1-git-send-email-yann.morin.1998@free.fr>
References: <1487499795-2205-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170219103516.ibi5c644ysdx6bkn@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Feb 19, 2017 at 11:23:15AM +0100, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/2bc/2bc84ba2d1167018e2d48e5183ead22b6425dcf5/
>     http://autobuild.buildroot.org/results/445/445f377ae70397b5f675f541977900e8986b79a4/
>     http://autobuild.buildroot.org/results/57e/57e6984427f8c5d906a93884cc461b8f93cf5ce0/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/mosquitto/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index 50937d0..bc2ab35 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_MOSQUITTO
>  	bool "mosquitto"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

What about symbols that select BR2_PACKAGE_MOSQUITTO 
(BR2_PACKAGE_COLLECTD_MQTT, BR2_PACKAGE_DOMOTICZ)?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
