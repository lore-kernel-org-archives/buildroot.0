From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 13:58:18 +0200
Subject: [Buildroot] [PATCH 8/8] package/mender: set version in go linker
In-Reply-To: <20180814231337.19114-9-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-9-mirza.krak@northern.tech>
Message-ID: <20180815135818.121312d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 01:13:37 +0200, Mirza Krak wrote:
> This is used when calling the mender client with the
> -version option and it says "unknown" if not set in
> linker.
> 
> Now it displays the following:
> 
>     # mender -version
>     1.4.0
>     runtime: go1.10.2
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/mender.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index ce48c82671..db0eb55454 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -17,6 +17,8 @@ ifeq ($(call qstrip,$(BR2_PACKAGE_MENDER_DEVICE_TYPE)),)
>  $(error Mender device type not set. Check your BR2_PACKAGE_MENDER_DEVICE_TYPE setting)
>  endif
>  
> +MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)

Is this main.Version property something specific to Mender, or
something that is common to Go packaging in general ? I'm just trying
to figure out if it should be in mender.mk like you did, or in
pkg-golang.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
