From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:28:16 +0200
Subject: [Buildroot] [PATCH 2/5] libssl: new virtual package.
In-Reply-To: <20170615142928.31927-2-aduskett@codeblue.com>
References: <20170615142928.31927-1-aduskett@codeblue.com>
 <20170615142928.31927-2-aduskett@codeblue.com>
Message-ID: <20170615232816.121a18b9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Nit: don't use a final "." in the commit titles.

On Thu, 15 Jun 2017 10:29:25 -0400, Adam Duskett wrote:
>     libressl is API compatible with OpenSSL 1.0.1 and is almost API compatible
>     with OpenSSL 1.0.2.  As such, a new virtual package is needed to handle
>     having both libressl and openssl.

No indentation of 4 spaces for the commit log.

> diff --git a/package/libssl/Config.in b/package/libssl/Config.in
> new file mode 100644
> index 0000000..71347de
> --- /dev/null
> +++ b/package/libssl/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HAS_LIBSSL
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_LIBSSL
> +	string
> +	depends on BR2_PACKAGE_HAS_LIBSSL

Should it be named "libssl" or "ssl". I think Arnout suggested just
"ssl" on IRC, didn't he?

Also, I believe for this package we should use the jpeg/jpeg-turbo
model instead of the conventional virtual package model, because we
want to be able to "select BR2_PACKAGE_LIBSSL". As your package is done
today, we would *have* to use only a "depends on BR2_PACKAGE_LIBRESSL",
which is a bit annoying.

Again, see the libjpeg virtual package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
