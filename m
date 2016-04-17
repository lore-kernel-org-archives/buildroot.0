From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 16:44:46 +0200
Subject: [Buildroot] [PATCH v3] gutenprint: fix host build
In-Reply-To: <20160417095237.GA4469@waldemar-brodkorb.de>
References: <20160417095237.GA4469@waldemar-brodkorb.de>
Message-ID: <20160417164446.168e07c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 11:52:37 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/gutenprint/0004-build-usb-backends-conditional.patch b/package/gutenprint/0004-build-usb-backends-conditional.patch
> new file mode 100644
> index 0000000..7c744be
> --- /dev/null
> +++ b/package/gutenprint/0004-build-usb-backends-conditional.patch
> @@ -0,0 +1,29 @@
> +Backport from Upstream:
> +https://sourceforge.net/p/gimp-print/source/ci/fc1713589fed645f2c8002c3f66dfb69af314716/
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

As suggested by Arnout, I've changed this to use a Git formatted patch
cherry-picked from the upstream Git repository.

>  GUTENPRINT_DEPENDENCIES = \
> @@ -67,6 +67,7 @@ HOST_GUTENPRINT_CONF_OPTS = \
>  	--disable-escputil \
>  	--disable-test \
>  	--disable-testpattern \
> +	--without-libusb \

This was not needed, so I removed it. It was needed in previous
iterations of your patch, but not with the latest version of the
backported patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
