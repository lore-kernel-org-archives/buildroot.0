From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 09:43:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: disable on nios2
In-Reply-To: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141130094300.256d43e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 29 Nov 2014 19:56:21 +0100, Bernd Kuhls wrote:

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

Can we instead please blacklist only the specific NIOS II toolchain
causing the problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
