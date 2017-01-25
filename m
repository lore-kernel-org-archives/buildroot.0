From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Jan 2017 16:44:03 +0200
Subject: [Buildroot] [V2 1/1] sngrep: new package
In-Reply-To: <20170125140904.26849-1-aduskett@codeblue.com>
References: <20170125140904.26849-1-aduskett@codeblue.com>
Message-ID: <20170125144403.bfj52rm3mmdjtd7n@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Jan 25, 2017 at 09:09:04AM -0500, Adam Duskett wrote:
> diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
> new file mode 100644
> index 0000000..a976cea
> --- /dev/null
> +++ b/package/sngrep/Config.in
> @@ -0,0 +1,17 @@
> +comment "sngrep needs a toolchain w/ wchar, threads"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

This comment does not match that actual dependencies below.

> +
> +

Redundant empty line.

> +config BR2_PACKAGE_SNGREP
> +	bool "sngrep"
> +	select BR2_PACKAGE_NCURSES_WCHAR
> +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	select BR2_PACKAGE_NCURSES_TARGET_FORM
> +	select BR2_PACKAGE_NCURSES_TARGET_MENU
> +	depends on BR2_PACKAGE_LIBPCAP
> +	depends on BR2_PACKAGE_NCURSES

These should be select.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
