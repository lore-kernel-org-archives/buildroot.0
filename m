From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:11:34 +0100
Subject: [Buildroot] [PATCH 14/16] package/util-linux: add more tool
 select options
In-Reply-To: <1421684056-5266-15-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-15-git-send-email-maxtram95@gmail.com>
Message-ID: <20150126231134.0695e3c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:14 +0200, Maxim Mikityanskiy wrote:
> Add more options to Config.in to allow optionally select or deselect
> util-linux tools.
> 
> Also fix s/BR2_PACKAGE_WDCTL/BR2_PACKAGE_UTIL_LINUX_WDCTL/

Ideally, this fix should have been in a separate patch. Note that there
is no need for Config.in.legacy handling, because the option has never
done anything, so renaming it doesn't hurt.

> @@ -36,6 +41,7 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS

I was originally not very happy of this additional select, which means
that libsmartcols now gets installed regardless of which binaries you
install. But it seems to be used by quite a few util-linux binaries
anyway, so ok.

So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
