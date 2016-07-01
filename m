From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 00:11:58 +0200
Subject: [Buildroot] [PATCH 15/31] package/systemd: add optional support
 for hibernation
In-Reply-To: <1467409891-9458-15-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467409891-9458-15-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702001158.5f43c1e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 23:51:15 +0200, Maxime Hadjinlian wrote:
> From: Gabe Evans <gabe@hashrabbit.co>
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in  | 10 +++++++++-
>  package/systemd/systemd.mk |  6 ++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index a857a95..3fcb74d 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -308,4 +308,12 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
>  	  When this feature is enabled, Systemd mounts smackfs and manages
>  	  security labels for sockets.
>  
> -endif
> +config BR2_PACKAGE_SYSTEMD_HIBERNATE
> +	bool "enable hibernation support"
> +	help
> +	  When this features is enabled, additional tools and services are built to
> +	  support suspending and resuming the system.
> +
> +	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
> +
> +endif # BR2_PACKAGE_SYSTEMD

The addition of the comment here has nothing to do with the patch being
done.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
