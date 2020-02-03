From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 19:51:06 +0100
Subject: [Buildroot] [PATCH 3/5] Move refpolicy policy version selection
 to libsepol
In-Reply-To: <20200203132951.1331252-3-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
 <20200203132951.1331252-3-aduskett@gmail.com>
Message-ID: <20200203195106.28bd4861@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I improved the commit title to fit our standard format. And also other
changes, see below.

On Mon,  3 Feb 2020 05:29:49 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> +config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
> +	bool "refpolicy version selection moved to libsepol"
> +	select BR2_LEGACY

This is not the correct way of doing legacy handling for string
options. See the header of Config.in.legacy for details. I fixed that
up.

> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index d13be18f73..001519f8cd 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -16,7 +16,8 @@ REFPOLICY_DEPENDENCIES = \
>  	host-policycoreutils \
>  	host-python3 \
>  	host-setools \
> -	host-gawk
> +	host-gawk \
> +	libsepol

We don't need libsepol as a build time dependency, so I dropped this.

Applied with the above things changed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
