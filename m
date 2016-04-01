From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Apr 2016 04:08:00 +0200
Subject: [Buildroot] [PATCH] package/turbolua: new package
In-Reply-To: <1458228459-2401-1-git-send-email-m.niestroj@grinn-global.com>
References: <1458228459-2401-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <20160401040800.759d3e8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

This looks really good, I only have a few minor comments/questions. In
fact, if I didn't had that question about thumb2, I would have
applied :)

On Thu, 17 Mar 2016 16:27:39 +0100, Marcin Niestroj wrote:

> diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
> new file mode 100644
> index 0000000..f42f4ca
> --- /dev/null
> +++ b/package/turbolua/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_TURBOLUA
> +	bool "turbolua"
> +	depends on BR2_PACKAGE_LUAJIT
> +	depends on !BR2_ARM_INSTRUCTIONS_THUMB2

It would be good to add a comment above this line to explain why Thumb2
is excluded.

> +	help
> +	  Turbo.lua is a framework built for LuaJIT 2 to simplify the task of
> +	  building fast and scalable network applications. It uses a
> +	  event-driven, non-blocking, no thread design to deliver excellent
> +	  performance and minimal footprint to high-load applications while
> +	  also providing excellent support for embedded uses. The toolkit can
> +	  be used for HTTP REST API?s, traditional dynamic web pages through
> +	  templating, open connections like WebSockets, or just as high level
> +	  building blocks for native speed network applications.

Please add an empty new line here, followed by the URL of the project
homepage.

> +define TURBOLUA_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \

Can you try to use $(TARGET_CONFIGURE_OPTS) instead of passing CC/LD ?
TARGET_CONFIGURE_OPTS will not only pass CC/LD, but also CFLAGS,
LDFLAGS and more.

> +define TURBOLUA_INSTALL_TARGET_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDCONFIG=true \

Same here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
