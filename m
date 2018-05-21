From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 10:00:39 +0200
Subject: [Buildroot] [PATCH 4/4] package/collectd: allow the grpc plugin
 to be configured
In-Reply-To: <20180521050550.11898-4-charles.hardin@storagecraft.com>
References: <20180521050550.11898-1-charles.hardin@storagecraft.com>
 <20180521050550.11898-4-charles.hardin@storagecraft.com>
Message-ID: <20180521100039.410647f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 22:05:50 -0700, charles.hardin at storagecraft.com
wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> Allow collectd to use the gRPC package since that package
> can now be compiled as part of buildroot. This plugin can
> be used to push collectd datasets over the network to
> other instances as needed.
> 
> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
> ---
>  package/collectd/Config.in   | 6 ++++++
>  package/collectd/collectd.mk | 4 +++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index ccd3fbe13f..0848e3c343 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -248,6 +248,12 @@ config BR2_PACKAGE_COLLECTD_GPS
>  	  Reports the number of sattelites seen by and precision
>  	  of a GPS receiver.
>  
> +config BR2_PACKAGE_COLLECTD_GRPC
> +	bool "grpc"
> +	select BR2_PACKAGE_GRPC

You need to propagate the dependencies of the gprc package here. For
example, collectd doesn't need C++ support, while gprc needs C++
support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
