From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 21 Mar 2017 19:06:15 +0200
Subject: [Buildroot] [PATCH v2] package/bluez5_utils: Allow user to
 enable disabled plugins
In-Reply-To: <874lymlg2y.fsf@dell.be.48ers.dk>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <874lymlg2y.fsf@dell.be.48ers.dk>
Message-ID: <1490115975.19767.148.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-03-21 at 18:01 +0100, Peter Korsgaard wrote:

> ?> +config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
> ?> +	bool "build deprecated tools"
> ?> +	help
> ?> +	??Build BlueZ 5.x deprecated tools (hciattach, gatttool,
> ...).
> ?> +
> ?>??config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
> ?>??	bool "install GATT tool"
> ?>??	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
> 
> Then _UTILS_GATTTOOL should depend on _UTILS_DEPRECATED.

There is a patch flying around (from Bernd) to fix build and add --
enable-deprecated to GATTTOOL in bluez5_utils.mk.

>  Or perhaps it
> doesn't make sense to have a dedicated option for this and it should
> just be automatically installed when deprecated is enabled.

Note, gatttool is left in noinst list, meaning the option should be
still here.

> It would also be good to add the autobuilder failures:
> 
> http://autobuild.buildroot.net/?reason=bluez5_utils-5.44

Makes sense.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
