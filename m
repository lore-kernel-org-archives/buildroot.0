From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:31:32 +0200
Subject: [Buildroot] [PATCH v4 3/8] package/libsepol: bump version to 3.0
In-Reply-To: <20200415125921.57648-4-matthew.weber@rockwellcollins.com>
References: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
 <20200415125921.57648-4-matthew.weber@rockwellcollins.com>
Message-ID: <20200417223132.3164bb49@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 07:59:16 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
>  	int "Policy version"
> +	default 32 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
>  	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>  	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
>  	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
> @@ -27,7 +28,7 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
>  	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
>  	  > 3.14 <= 4.3    29
>  	  > 4.3 <= 4.13    30
> -	  > 4.13           31  
> +	  > 4.13 <= 5.5    31

A line should have been added for version 32 here, but while doing
this, I noticed our help text was wrong. Indeed, version 31 is
supported starting from kernel 4.13 included, so it should have been a
>= 4.13 here.

I added a preliminary patch fixing that, and applied yours on top of it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
