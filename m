From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Mon, 17 Sep 2007 10:03:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <20070917075500.052F2A4692@busybox.net>
References: <20070917075500.052F2A4692@busybox.net>
Message-ID: <1190016191.7545.8.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-09-17 at 00:55 -0700, aldot at uclibc.org wrote:
> Author: aldot
> Date: 2007-09-17 00:54:52 -0700 (Mon, 17 Sep 2007)
> New Revision: 19862
> 
> Log:
> - Atmel mirrors are only of interrest for atmel
> 
> 
> Modified:
>    trunk/buildroot/target/device/Mirrors.in
> 
> 
> Changeset:
> Modified: trunk/buildroot/target/device/Mirrors.in
> ===================================================================
> --- trunk/buildroot/target/device/Mirrors.in	2007-09-16 19:41:40 UTC (rev 19861)
> +++ trunk/buildroot/target/device/Mirrors.in	2007-09-17 07:54:52 UTC (rev 19862)
> @@ -4,14 +4,16 @@
>  	string "Sourceforge mirror site"
>  	default "easynews"
>  	help
> -	  Sourceforge has a system of mirror sites.  Some sites may be closer
> -	  to your location, and sometimes mirror sites go down and are no longer
> -	  available.  This option allows you to select your preferred Sourceforge
> -	  mirror site.
> +	  Sourceforge has a system of mirror sites.  Some sites may be
> +	  closer to your location, and sometimes mirror sites go down
> +	  and are no longer available.  This option allows you to select
> +	  your preferred Sourceforge mirror site.
>  
>  	  The list of mirrors is available here:
>  	  http://prdownloads.sourceforge.net/index-sf.html?download
>  
> +if BR2_avr32

Add a "|| BR2_arm", as this is used for AT91 stuff AFAIK.

>  source	"target/device/Atmel/Mirrors.in"
> +endif
>  
>  endmenu

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
