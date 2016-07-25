From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 20:22:51 +0200
Subject: [Buildroot] [PATCH] odroid-scripts: select fbset if selected.
In-Reply-To: <20160725180120.24643-1-daggs@gmx.com>
References: <20160725180120.24643-1-daggs@gmx.com>
Message-ID: <20160725202251.769be926@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 21:01:20 +0300, Dagg Stompler wrote:
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/odroid-scripts/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
> index 48544b6..975b4fd 100644
> --- a/package/odroid-scripts/Config.in
> +++ b/package/odroid-scripts/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_ODROID_SCRIPTS
>  	bool "odroid-scripts"
>  	depends on BR2_aarch64 || BR2_arm
> +	select BR2_PACKAGE_FBSET

But then you miss the select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
