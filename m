From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:28:40 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/intel-mediasdk: new package
In-Reply-To: <20190205181946.14496-3-lpdev@cordier.org>
References: <20190205181946.14496-1-lpdev@cordier.org>
 <20190205181946.14496-3-lpdev@cordier.org>
Message-ID: <20190416222840.3c2110c7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 19:19:44 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>

I have applied as well, with some changes, see below.

> diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
> new file mode 100644
> index 0000000000..8a11d92cac
> --- /dev/null
> +++ b/package/intel-mediasdk/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_INTEL_MEDIASDK
> +	bool "intel-mediasdk"
> +	depends on BR2_x86_64
> +	select BR2_PACKAGE_INTEL_MEDIADRIVER

You can't select a package like this without replicating all its
dependencies. So I've done that.

Also, it was missing a select BR2_PACKAGE_LIBDRM_INTEL, without which
it doesn't build.

And for this package as well, -fstack-protector usage breaks with
non-SSP toolchains, so I added
package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch to work
around that. Could you work on an upstreamable solution to this issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
