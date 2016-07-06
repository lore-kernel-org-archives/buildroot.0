From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 06 Jul 2016 21:42:10 +0200
Subject: [Buildroot] [v2] package/libgpg-error: bump to version 1.23
References: <1467589714-6122-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <ih305dxce7.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the patches to libssh and libssh2 look wrong. If I select openssl
then I can select neither libssh nor libssh2 anymore.

Am Mon, 04 Jul 2016 01:48:34 +0200 schrieb Maxime Hadjinlian:

> diff --git a/package/libssh/Config.in b/package/libssh/Config.in
> index 3357fb9..6029f45 100644
> --- a/package/libssh/Config.in
> +++ b/package/libssh/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSSH
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# Either OpenSSL or libgcrypt are mandatory
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
>  	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
>  	help
>  	  libssh is a multiplatform C library implementing the SSHv2
> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
> index 017fd40..0deb3bb 100644
> --- a/package/libssh2/Config.in
> +++ b/package/libssh2/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBSSH2
>  	bool "libssh2"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
>  	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
>  	help
>  	  libssh2 is a client-side C library implementing the SSH2

Both packages support either openssl or libgcrypt.

Regards, Bernd
