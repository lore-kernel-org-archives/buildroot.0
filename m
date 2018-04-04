From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Wed, 4 Apr 2018 14:49:39 -0300 (BRT)
Subject: [Buildroot] [PATCH] iqvlinux: remove package
In-Reply-To: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
References: <20180404160009.16337-1-thomas.petazzoni@bootlin.com>
Message-ID: <1528136664.1654633.1522864179308.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> +++ b/Config.in.legacy
> @@ -145,6 +145,24 @@ endif
> ###############################################################################
> comment "Legacy options removed in 2018.05"
> 
> +config BR2_PACKAGE_IQVLINUX
> +	bool "iqvlinux packaged removed"
> +	select BR2_LEGACY
> +	help
> +	  This package contained a kernel module from Intel, which
> +	  could only be used together with Intel userspace tools
> +	  provided under NDA, which also come with the same kernel
> +	  module. The copy of the kernel module available on
> +	  SourceForge is only provided only to comply with the GPLv2
> +	  requirement. Intel engineers were even surprised it even
> +	  built and were not willing to make any effort to fix their
> +	  tarball naming to contain a version number. Therefore, it
> +	  does not make sense for Buildroot to provide such a package.
> +
> +	  See https://sourceforge.net/p/e1000/bugs/589/ for the
> +	  discussion.
> +
> +

Could you fix the warning from check-package?
It can be done when applying.

Thanks,
Ricardo
