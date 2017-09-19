From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 19 Sep 2017 08:06:05 -0300 (BRT)
Subject: [Buildroot] [PATCH] util-linux: add missing dynamic library
	dependency
In-Reply-To: <c446f43f2cc6b98efd08a0e499bb192337e26271.1505798272.git.baruch@tkos.co.il>
References: <c446f43f2cc6b98efd08a0e499bb192337e26271.1505798272.git.baruch@tkos.co.il>
Message-ID: <2117594712.9872305.1505819165059.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> De: "Baruch Siach" <baruch@tkos.co.il>
> Para: buildroot at busybox.net
> Cc: "Baruch Siach" <baruch@tkos.co.il>, "Carlos Santos" <casantos@datacom.ind.br>
> Enviadas: Ter?a-feira, 19 de setembro de 2017 2:17:52
> Assunto: [PATCH] util-linux: add missing dynamic library dependency

> Commit f52af619185 (util-linux: add menu items for login utilities)
> forgot to propagate the !BR2_STATIC_LIBS dependency of linux-pam to
> BR2_PACKAGE_UTIL_LINUX_LOGIN. Fix this.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e47/e472891a656e40f33081d9a5db1b1b6d71c1389f/
> http://autobuild.buildroot.net/results/9e4/9e443720ca247292ea612851962c611a9bcd3450/
> http://autobuild.buildroot.net/results/88f/88f4cecd7e2844701b0e75279c112e37283fc7f9/
> 
> Cc: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> package/util-linux/Config.in | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 80aab881a0da..5a600c333db3 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -173,6 +173,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
> 	bool "login"
> 	depends on BR2_ENABLE_LOCALE # linux-pam
> 	depends on BR2_USE_WCHAR # linux-pam
> +	depends on !BR2_STATIC_LIBS # linux-pam
> 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
> 	depends on BR2_USE_MMU # fork(), linux-pam
> 	select BR2_PACKAGE_LINUX_PAM
> --
> 2.14.1

Reviewed-by: Carlos Santos <casantos@datacom.ind.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
