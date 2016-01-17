From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jan 2016 15:38:06 +0100
Subject: [Buildroot] [PATCH v2] package/libbroadvoice: Broken on BR2_arc
 with gcc <= 4.8
In-Reply-To: <1453038796-7041-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453038796-7041-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160117153806.6baea4a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 17 Jan 2016 14:53:16 +0100, Bernd Kuhls wrote:

> diff --git a/package/libbroadvoice/Config.in b/package/libbroadvoice/Config.in
> index d695df0..3301ba8 100644
> --- a/package/libbroadvoice/Config.in
> +++ b/package/libbroadvoice/Config.in
> @@ -1,5 +1,8 @@
>  config BR2_PACKAGE_LIBBROADVOICE
>  	bool "libbroadvoice"
> +	# broken with gcc <= 4.8 on arc
> +	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
> +	depends on !BR2_arc || BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

If the bug affects gcc 4.8, and ARC currently uses gcc 4.8, why do you
need the "!BR2_arc" part of the condition ?

Doing:

	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

is sufficient, and will ensure that this package will be built again
once ARC is moved to a gcc 4.9 based toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
