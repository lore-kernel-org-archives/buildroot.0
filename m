From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 21:41:47 +0200
Subject: [Buildroot] [PATCH v2] libmad: Add optimization config options
In-Reply-To: <1218634753.1336082.1342200312454.JavaMail.root@advansee.com>
References: <1655432189.1326270.1342189713400.JavaMail.root@advansee.com>
 <1218634753.1336082.1342200312454.JavaMail.root@advansee.com>
Message-ID: <20120713214147.7fd4d1e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 13 Jul 2012 19:25:12 +0200 (CEST),
Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> a ?crit :

> Changes for v2:
>    - Factorize the 'able' in the $(if ).

I prefer the solution in v1 with regard to this, as it is much easier
to read.

> +choice
> +	prompt "Speed vs. accuracy"
> +	default BR2_PACKAGE_LIBMAD_SPEED_ACCURACY

What about calling those options:

 BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED
 BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY
 BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT

> +config BR2_PACKAGE_LIBMAD_SPEED_ACCURACY
> +	bool "Optimize for both speed and accuracy"

This should rather be:

	bool "Default"

or something like that. Technically, this option does not enable any
special optimization for both speed and accuracy, it just uses the
default options.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
