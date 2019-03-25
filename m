From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 17:54:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk: Add architecture
 support list
In-Reply-To: <20190325153733.14885-1-aduskett@gmail.com>
References: <20190325153733.14885-1-aduskett@gmail.com>
Message-ID: <20190325175438.73aee6c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 25 Mar 2019 11:37:33 -0400
aduskett at gmail.com wrote:

> +# Taken from make/autoconf/platform.m4
> +config BR2_PACKAGE_OPENJDK_BIN_ARCH_SUPPORTS

This should have been just:

	BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS

>  comment "openjdk needs X.Org"
> +	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS

Valgrind ?

Should have been:

+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS


>  comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
>  	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS

Ditto.

>  comment "openjdk does not support soft float configurations"
> +	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS

Ditto.

I fixed those issues and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
