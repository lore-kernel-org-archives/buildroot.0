From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 13:12:42 +0200
Subject: [Buildroot] [RFC v9 06/10] cpe-info: update manual for new pkg
 vars
In-Reply-To: <20200616170341.45098-6-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-6-matthew.weber@rockwellcollins.com>
Message-ID: <20200625131242.07bf9831@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2020 12:03:37 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Provide guidance on setting up the *_CPE_* and *_CVE_* variables.

There are only _CPE_ variables, no _CVE_ variable is documented here.

> +* +LIBFOO_CPE_ID_VENDOR+
> +  This variable is optional. It only must be defined if the package name
> +  does not match what the CPE ID uses for the vendor. By default it's set
> +  to <pkg-name>_project.
> +
> +* +LIBFOO_CPE_ID_NAME+
> +  This variable is optional. It only must be defined if the package name
> +  does not match what the CPE ID uses for the name. By default it's set
> +  to <pkg-name>.
> +
> +* +LIBFOO_CPE_ID_VERSION+
> +  This variable is optional. By default it's set to <pkg-version>.
> +
> +* +LIBFOO_CPE_ID_VERSION_MINOR+
> +  This variable is optional. By default it's set to *.

None of this documentation describes *what* those variables must
contain. It says it's optional, what is the default value, but does not
explain what value it should be set to. This is especially true for
VERSION vs. VERSION_MINOR.

> +* +LIBFOO_CPE_ID+ is optional, as the package infrastructure hangles the
> +  default case of a single package's Common Product Enumeration (CPE)
> +  identification string. +make cpe-info+ copies all of these into a
> +  +cpe-manifest.csv+ file. To identify a package's possible CPE,
> +  the National Vunerability Database can be searched at
> +  https://nvd.nist.gov/products/cpe/search.

This explanation could be extended a bit to explain clearly that a
default _CPE_ID value will be defined based on the other CPE_ID_*
variables, and that this should be used to override the overall value
only in special situations.

However, in practice, do we have such cases ? Do you have situation
where customizing VENDOR, NAME, VERSION, VERSION_MINOR is not enough,
and you have to set a package-specific CPE_ID value directly ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
