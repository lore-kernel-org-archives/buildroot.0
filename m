From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Jan 2014 05:39:17 +0200
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
References: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
Message-ID: <20140107033917.GD4503@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Mon, Jan 06, 2014 at 10:09:02PM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---

[...]

> diff --git a/package/vlc/Config.in b/package/vlc/Config.in
> new file mode 100644
> index 0000000..83576e9
> --- /dev/null
> +++ b/package/vlc/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_VLC
> +	bool "vlc"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # spawn.h

My uClibc toolchain has spawn.h as well. Is this a specific feature that is 
missing in uClibc?

> +	help
> +	  VLC is a free and open source cross-platform multimedia player
> +	  and framework that plays most multimedia files as well as DVD,
> +	  Audio CD, VCD, and various streaming protocols.
> +
> +	  http://www.videolan.org/vlc/
> +
> +comment "vlc needs an (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
