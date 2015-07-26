From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jul 2015 01:20:39 +0300
Subject: [Buildroot] [PATCH v8 1/1] mosh: new package
In-Reply-To: <1437928447-26907-1-git-send-email-christian@paral.in>
References: <1437928447-26907-1-git-send-email-christian@paral.in>
Message-ID: <20150726222039.GL17029@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Sun, Jul 26, 2015 at 09:34:07AM -0700, Christian Stewart wrote:
> diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> new file mode 100644
> index 0000000..9841b2e
> --- /dev/null
> +++ b/package/mosh/Config.in
> @@ -0,0 +1,19 @@
> +comment "mosh needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

The dependencies comment should depend on supported arches. Since this patch 
has already been applied, I'll send a follow-up.

> +config BR2_PACKAGE_MOSH
> +	bool "mosh"
> +	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
> +	depends on BR2_TOOLCHAIN_HAS_THREADS #protobuf
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSH if !BR2_PACKAGE_DROPBEAR_CLIENT
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Remote terminal application that supports intermittent connectivity,
> +	  allows roaming, and provides speculative local echo and line editing
> +	  of user keystrokes.
> +
> +	  https://mosh.mit.edu

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
