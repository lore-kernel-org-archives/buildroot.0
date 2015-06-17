From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jun 2015 23:06:40 +0200
Subject: [Buildroot] [PATCH v7 02/22] setools: new package
In-Reply-To: <1433251718-3167-3-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-3-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150617230640.323fb9fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue,  2 Jun 2015 08:28:18 -0500, Clayton Shotwell wrote:

> diff --git a/package/setools/setools.hash b/package/setools/setools.hash
> new file mode 100644
> index 0000000..3fac21d
> --- /dev/null
> +++ b/package/setools/setools.hash
> @@ -0,0 +1,4 @@
> +# From https://github.com/TresysTechnology/setools3/wiki/Download
> +md5	d68d0d4e4da0f01da0f208782ff04b91	setools-3.3.8.tar.bz2
> +#Locally computed

I've added a missing space here after #

> +# configure.ac is patched by the cross compile patch,
> +# so autoreconf is necessary
> +SETOOLS_AUTORECONF = YES

[...]

> +# configure.ac is patched by the cross compile patch,
> +# so autoreconf is necessary
> +HOST_SETOOLS_AUTORECONF = YES

This HOST_SETOOLS_AUTORECONF is not needed, it gets inherited from
SETOOLS_AUTORECONF = YES automatically, so I've fixed that as well.

Applied with those two minor changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
