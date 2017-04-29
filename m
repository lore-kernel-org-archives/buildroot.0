From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:14:09 +0200
Subject: [Buildroot] [PATCH v2 04/25] fix ordering on configs starting
 with 'c'
In-Reply-To: <20170422171811.1346-4-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
 <20170422171811.1346-4-Adamduskett@outlook.com>
Message-ID: <20170429211409.51461a47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:17:50 -0400, Adam Duskett wrote:

> diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
> index af18ba9..c5f43f2 100644
> --- a/package/cdrkit/Config.in
> +++ b/package/cdrkit/Config.in
> @@ -1,10 +1,10 @@
>  config BR2_PACKAGE_CDRKIT
> +	bool "cdrkit"
>  	# Needed for libbz
> +	depends on BR2_USE_MMU # fork
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_LIBCAP
>  	select BR2_PACKAGE_ZLIB
> -	depends on BR2_USE_MMU # fork
> -	bool "cdrkit"

Good example of change that introduce something not completely correct:
the "Needed for libbz" comment is no longer at the right place. I've
moved it to the right location.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
