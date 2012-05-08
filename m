From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 May 2012 10:14:55 +0200
Subject: [Buildroot] [PATCH 1/5] Added the libassuan package.
In-Reply-To: <1336424385-8933-1-git-send-email-stijn.souffriau@essensium.com>
References: <1336424385-8933-1-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <20120508101455.38a759b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stijn,

Thanks, we're making good progress here.

Le Mon,  7 May 2012 22:59:41 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> @@ -281,6 +281,7 @@ source "package/libgpg-error/Config.in"
>  source "package/libnss/Config.in"
>  source "package/openssl/Config.in"
>  source "package/polarssl/Config.in"
> +source "package/libassuan/Config.in"

Entries should be ordered alphabetically.

> diff --git a/package/libassuan/Config.in b/package/libassuan/Config.in
> new file mode 100644
> index 0000000..3b188ec
> --- /dev/null
> +++ b/package/libassuan/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBASSUAN
> +	bool "libassuan"

Since your package depends on libgpg-error, you need a

	select BR2_PACKAGE_LIBGPG_ERROR

here.

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
