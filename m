From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:11:00 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix a runtime bug (no text
 displayed in GUI) when an external glibc toolchain is used
In-Reply-To: <1425502935-18002-1-git-send-email-julien.boibessot@free.fr>
References: <1425502935-18002-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20150304221100.18c7ff17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear julien.boibessot at free.fr,

On Wed,  4 Mar 2015 22:02:15 +0100, julien.boibessot at free.fr wrote:

> +# Otherwise no text is displayed in user interface when compiled with an
> +# external glibc toolchain (iconv_open() is required at runtime for UTF-8 to
> +# UTF-32 conversion)
> +comment "kodi needs an external glibc toolchain which copy gconv libraries"
> +	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS && BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	depends on !BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY

As suggested by Yann, what about:

	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_EXTERNAL_GLIBC

 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
