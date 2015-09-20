From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 19:06:22 +0200
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
 lxc-checkconfig runtime
In-Reply-To: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
References: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150920190622.3f7278c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Sun, 20 Sep 2015 18:02:07 +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> lxc executables such as lxc-checkconfig require scripts provided by
> gzip such as zgrep.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/lxc/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lxc/Config.in b/package/lxc/Config.in
> index ffd9b4a..5377977 100644
> --- a/package/lxc/Config.in
> +++ b/package/lxc/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LXC
>  	bool "lxc"
>  	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_GZIP # runtime, for lxc-checkconfig

BR2_PACKAGE_GZIP depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, so you
should select it as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
