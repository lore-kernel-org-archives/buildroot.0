From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Apr 2015 14:22:17 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/exim: Add optional OpenSSL
 support
In-Reply-To: <1428837208-25941-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428837208-25941-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150412112217.GK2279@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Apr 12, 2015 at 01:13:28PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

[...]

> @@ -101,7 +110,7 @@ endif
>  # "The -j (parallel) flag must not be used with make"
>  # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
>  define EXIM_BUILD_CMDS
> -	build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
> +	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)

Is this change necessary as part of adding openssl dependency? If so, please 
explain how in the commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
