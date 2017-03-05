From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 5 Mar 2017 18:44:33 +0200
Subject: [Buildroot] [PATCH 2/9] package/darktable: new package
In-Reply-To: <20170305151004.2815-2-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
 <20170305151004.2815-2-romain.naour@gmail.com>
Message-ID: <20170305164433.d4qztfsrop5agq3a@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, Mar 05, 2017 at 04:09:57PM +0100, Romain Naour wrote:
> Add a small note about adwaita icon to avoid a Gtk warning:
> 
> Gtk-WARNING **: Could not find the icon 'pan-down-symbolic-ltr'. The 'hicolor' theme
> was not found either, perhaps you need to install it.
> You can get a copy from:
>         http://icon-theme.freedesktop.org/releases
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>

[...]

> +# Darktable is only available for x86_64 or aarch64 little endian system only.
> +# Experimental support for i386 (not recommended).
> +# Building without SSE2 on x86_64 is highly experimental.
> +# See src/is_supported_platform.h
> +config BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS
> +	bool
> +	default y if (BR2_x86_64 && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2) || \
> +		BR2_aarch64

BR2_X86_CPU_HAS_SSE2=y implies BR2_X86_CPU_HAS_SSE=y. So this is equivalent to 
(BR2_x86_64 && BR2_X86_CPU_HAS_SSE2) || BR2_aarch64.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
