From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:17:11 +0100
Subject: [Buildroot] [PATCH] package/lualdap: new package
In-Reply-To: <20201220135514.251951-1-francois.perrad@gadz.org>
References: <20201220135514.251951-1-francois.perrad@gadz.org>
Message-ID: <20201231151711.335f09ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Dec 2020 14:55:14 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> new file mode 100644
> index 000000000..2a71836ae
> --- /dev/null
> +++ b/package/lualdap/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LUALDAP
> +	bool "lualdap"
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_PACKAGE_LUA_5_4
> +	depends on BR2_USE_WCHAR # openldap
> +	depends on BR2_USE_MMU # openldap
> +	select BR2_PACKAGE_OPENLDAP
> +	help
> +	  LuaLDAP is a simple interface from Lua to an LDAP client,
> +	  in fact it is a bind to OpenLDAP client.
> +
> +	  https://github.com/lualdap/lualdap
> +
> +comment "lualdap needs a toolchain w/ wchar, dynamic library, Lua <= 5.3"

Just a note: you had forgotten the "depends on BR2_USE_MMU" here. I
fixed that when applying.

> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
