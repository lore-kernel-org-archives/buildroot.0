From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 23:59:07 +0200
Subject: [Buildroot] [PATCH v4 2/3] package/gettext-gnu: bump version to
 0.20.1
In-Reply-To: <20200421205504.3061551-2-aduskett@gmail.com>
References: <20200421205504.3061551-1-aduskett@gmail.com>
 <20200421205504.3061551-2-aduskett@gmail.com>
Message-ID: <20200427235907.4de50d49@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Apr 2020 13:55:03 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Update license hash due to http -> https URL changes.
>   - Depend on host-libtextstyle for host-gettext-gnu.
>   - Update 0001-error_print_progname.patch to apply cleanly.
>   - Remove upstream 0002-Update-after-gnulib-changed.patch
>   - Add 0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
>     which allows gettext-tools to build with an external libtextstyle.
> 
> Tested under Debian 8 with test-pkg -a:
> 44 builds, 5 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied, with one change.

> diff --git a/package/gettext-gnu/Config.in b/package/gettext-gnu/Config.in
> index 27e7a3da4c..85ddb62788 100644
> --- a/package/gettext-gnu/Config.in
> +++ b/package/gettext-gnu/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_GETTEXT_GNU
>  	bool
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_HAS_GETTEXT
> +	select BR2_PACKAGE_LIBTEXTSTYLE

This was not needed: the target libtextstyle package does not exist.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
