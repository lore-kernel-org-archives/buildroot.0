From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 13:53:30 +0200
Subject: [Buildroot] [PATCH 4/8] package/mender: add
 BR2_PACKAGE_MENDER_ARTIFACT_NAME option
In-Reply-To: <20180814231337.19114-5-mirza.krak@northern.tech>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-5-mirza.krak@northern.tech>
Message-ID: <20180815135330.2fa7ad72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 01:13:33 +0200, Mirza Krak wrote:

> +if BR2_PACKAGE_MENDER
> +
> +config BR2_PACKAGE_MENDER_ARTIFACT_NAME
> +	string "Mender artifact name"
> +	help
> +	  The name of the image or update that will be built. This is what the
> +	  device will report that it is running, and different updates must have
> +	  different names.
> +
> +	  Will be stored in /etc/mender/artifact_info
> +
> +endif

I am wondering if we really need a new option for that, or if you
shouldn't just let the user add /etc/mender/artifact_info to its root
filesystem overlay.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
