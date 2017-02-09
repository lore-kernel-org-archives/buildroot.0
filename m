From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Feb 2017 23:30:19 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/bluez-tools: new package
In-Reply-To: <20170209212616.32550-1-bernd.kuhls@t-online.de>
References: <20170209212616.32550-1-bernd.kuhls@t-online.de>
Message-ID: <20170209213019.a3tweamrwr27dnk3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Thu, Feb 09, 2017 at 10:26:16PM +0100, Bernd Kuhls wrote:
> +ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
> +BLUEZ_TOOLS_DEPENDENCIES += bluez_utils
> +# readline is an optional dependency when used with bluez_utils
> +# obex support depends on readline so enable it optionally
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +BLUEZ_TOOLS_CONF_OPTS += --enable-obex
> +BLUEZ_TOOLS_DEPENDENCIES += readline
> +else
> +BLUEZ_TOOLS_CONF_OPTS += --disable-obex
> +endif
> +else
> +# readline is a hard dependency when used with bluez5_utils
> +BLUEZ_TOOLS_DEPENDENCIES += bluez5_utils readline
> +endif

Looks overly complex to me. Why not treat readline as a usual optional 
dependency, independent from the bluez version?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
