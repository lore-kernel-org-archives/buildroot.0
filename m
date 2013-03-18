From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Mar 2013 17:27:06 +0200
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
In-Reply-To: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
References: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130318152706.GV5654@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Mon, Mar 18, 2013 at 02:56:57PM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Now that zeromq has been bumped to version 3.2.2, we need to provide the
> C++ bindings using separate packages. Two C++ bindings are provided by this
> patch:
> 
>   * cppzmq is a very simple single-header binding
>   * zmqpp is a high-level binding, implemented in C++ as a separate library
> 
> When the new "C++ bindings" option for zeromq is selected, both of these
> C++ bindings are built and installed.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---

[...]

> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -1,9 +1,8 @@
> -comment "zeromq requires a toolchain with C++, LARGEFILE + WCHAR support"
> -	depends on !(BR2_INSTALL_LIBSTDCPP &&  BR2_LARGEFILE && BR2_USE_WCHAR)
> +comment "zeromq requires a toolchain with LARGEFILE and WCHAR support"
> +	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
>  
>  config BR2_PACKAGE_ZEROMQ
>  	bool "zeromq"
> -	depends on BR2_INSTALL_LIBSTDCPP

Although only the C binding is bundled with zeromq, the library itself seems 
to be implemented in C++, so this is not correct.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
