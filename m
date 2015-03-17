From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Mar 2015 12:13:05 +0200
Subject: [Buildroot] [PATCH] package/sysdig: New package
In-Reply-To: <1426499014-15851-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1426499014-15851-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150317101305.GL2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Mon, Mar 16, 2015 at 10:43:34AM +0100, Angelo Compagnucci wrote:
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> new file mode 100644
> index 0000000..ff873a8
> --- /dev/null
> +++ b/package/sysdig/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_SYSDIG
> +	bool "sysdig"
> +	depends on BR2_PACKAGE_ZLIB
> +	depends on BR2_PACKAGE_LUAJIT
> +	depends on BR2_PACKAGE_LIBJSON

We generally 'select' packages that are mandatory dependencies, and copy their 
dependencies here. See 
http://nightly.buildroot.org/manual.html#depends-on-vs-select.

> +	depends on BR2_LINUX_KERNEL

This is OK, though. But please also add a comment as described in 
http://nightly.buildroot.org/manual.html#_dependencies_on_a_linux_kernel_built_by_buildroot.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
