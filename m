From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 23:14:24 +0100
Subject: [Buildroot] [PATCH v2,1/3] python-vcversioner: new package
In-Reply-To: <1482085039-64073-1-git-send-email-fabrice.fontaine@orange.com>
References: <1482085039-64073-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161218231424.5723664f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 19:17:17 +0100, Fabrice Fontaine wrote:

> diff --git a/package/python-vcversioner/Config.in b/package/python-vcversioner/Config.in
> new file mode 100644
> index 0000000..9383ef4
> --- /dev/null
> +++ b/package/python-vcversioner/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_VCVERSIONER
> +	bool "python-vcversioner"
> +	help
> +	  Use version control tags to discover version numbers.
> +
> +	  https://github.com/habnabit/vcversioner

A Config.in option to enable the target variant of a package...

> +$(eval $(host-python-package))

... that has no target variant is not correct.

Please add only the .mk file and .hash file. The Config.in file should
not exist at all.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
