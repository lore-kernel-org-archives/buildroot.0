From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 24 Jul 2012 14:45:18 +0800
Subject: [Buildroot] [PATCH 2/2] New package: cpuload (Updated)
In-Reply-To: <1342764221-16660-1-git-send-email-keguang.zhang@gmail.com>
References: <1342764221-16660-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <CAJhJPsWzOPq_M=XqQuiuXnJLybnD4r3JCsfw8pO8y=G1txCesQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

What about this package?
I had updated cpuload to version 0.3 to remove unnecessary
wide-character string code.

2012/7/20 Kelvin Cheung <keguang.zhang@gmail.com>

> Add new package: cpuload
>
> cpuload is a simple tool to obtain intuitive vision of CPU load
> (including total, user, system, irq and softirq) within a certain
> time, which is especially useful for embedded system without GUI.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
> Updated cpuload to version 0.3 to remove unnecessary
> wide-character string code.
> ---
>  package/Config.in          |    1 +
>  package/cpuload/Config.in  |    8 ++++++++
>  package/cpuload/cpuload.mk |   11 +++++++++++
>  3 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 package/cpuload/Config.in
>  create mode 100644 package/cpuload/cpuload.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 154b82c..817716b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -658,6 +658,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/bootutils/Config.in"
>  endif
>  source "package/bwm-ng/Config.in"
> +source "package/cpuload/Config.in"
>  source "package/htop/Config.in"
>  source "package/kmod/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/cpuload/Config.in b/package/cpuload/Config.in
> new file mode 100644
> index 0000000..82bc450
> --- /dev/null
> +++ b/package/cpuload/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CPULOAD
> +       bool "cpuload"
> +       help
> +         cpuload is a simple tool to obtain intuitive vision of CPU load
> +         (including total, user, system, irq and softirq) within a certain
> +         time, which is especially useful for embedded system without GUI.
> +
> +         https://github.com/kelvincheung/cpuload
> diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
> new file mode 100644
> index 0000000..62a9138
> --- /dev/null
> +++ b/package/cpuload/cpuload.mk
> @@ -0,0 +1,11 @@
> +#############################################################
> +#
> +# cpuload
> +#
> +#############################################################
> +
> +CPULOAD_VERSION = v0.3
> +CPULOAD_SITE = git://github.com/kelvincheung/cpuload.git
> +
> +
> +$(eval $(autotools-package))
> --
> 1.7.1
>
>


-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120724/dc4ecba1/attachment.html>
