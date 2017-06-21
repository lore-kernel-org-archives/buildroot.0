From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:41:39 +0200
Subject: [Buildroot] [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170618184200.31167-2-geomatsi@gmail.com>
References: <20170618184200.31167-1-geomatsi@gmail.com>
 <20170618184200.31167-2-geomatsi@gmail.com>
Message-ID: <20170621224139.720d19cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 21:41:59 +0300, Sergey Matyukevich wrote:
> This patch adds xradio wireless driver for SDIO WiFi chip XR819.
> The out-of-tree driver is sourced from fifteenhex's work
> on github https://github.com/fifteenhex/xradio
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks for your contribution. I've applied, after some minor changes,
see below.

> ---
>  package/Config.in                      |  1 +
>  package/xr819-xradio/Config.in         | 10 ++++++++++
>  package/xr819-xradio/xr819-xradio.hash |  2 ++
>  package/xr819-xradio/xr819-xradio.mk   | 13 +++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/xr819-xradio/Config.in
>  create mode 100644 package/xr819-xradio/xr819-xradio.hash
>  create mode 100644 package/xr819-xradio/xr819-xradio.mk

You forgot to add an entry to the DEVELOPERS file, so I've added one.

> diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
> new file mode 100644
> index 000000000..5539004be
> --- /dev/null
> +++ b/package/xr819-xradio/Config.in
> @@ -0,0 +1,10 @@
> +comment "xradio wireless driver needs a Linux kernel to be built"

The comment should mention the package name as-is, i.e:

comment "xr819-xradio needs a Linux kernel to be built.

I've fixed both issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
