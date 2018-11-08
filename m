From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:43:37 +0100
Subject: [Buildroot] [PATCH v1 1/2] ell: new package
In-Reply-To: <20181105220426.17194-1-ps.report@gmx.net>
References: <20181105220426.17194-1-ps.report@gmx.net>
Message-ID: <20181108214337.720dc93e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Nov 2018 23:04:25 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied, after adjusting two things.

> ---
>  package/Config.in                             |  1 +
>  ...-standard-sigset_t-fixes-musl-compil.patch | 57 +++++++++++++++++++
>  package/ell/Config.in                         | 13 +++++
>  package/ell/ell.hash                          |  5 ++
>  package/ell/ell.mk                            | 27 +++++++++

You forgot to add an entry to the DEVELOPERS file.

> +comment "ell needs a toolchain w/ dynamic library, wchar"
> +	depends on BR2_STATIC_LIBS
> +	depends on !BR2_USE_WCHAR

This should have been:

+comment "ell needs a toolchain w/ dynamic library, wchar"
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4
+       depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR

Applied with those two issues fixed. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
