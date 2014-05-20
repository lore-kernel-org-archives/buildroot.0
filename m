From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 09:07:53 +0200
Subject: [Buildroot] [PATCH 1/3] python: new module flup
In-Reply-To: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
References: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <20140520090753.6057d39c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear oli vogt,

On Tue, 20 May 2014 13:52:58 +1200, oli vogt wrote:
> This module is useful to implement a fastCGI webserver
> Tested with ARM and Python 2.7.6
> 
> Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>

Thanks for this contribution! See a few comments below.

>  source "package/python-json-schema-validator/Config.in"
> diff --git a/package/python-flup/Config.in b/package/python-flup/Config.in
> new file mode 100644
> index 0000000..cc0efa5
> --- /dev/null
> +++ b/package/python-flup/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_FLUP
> +	bool "python-flup"
> +	depends on BR2_PACKAGE_PYTHON

Have you been able to test if this module works with Python 3 ?

> diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
> new file mode 100644
> index 0000000..0525dc9
> --- /dev/null
> +++ b/package/python-flup/python-flup.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# python-flup
> +#
> +################################################################################
> +
> +PYTHON_FLUP_VERSION = 1.0.3.dev-20110405
> +PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
> +PYTHON_FLUP_SITE = http://pypi.python.org/packages/source/f/flup
> +PYTHON_FLUP_SETUP_TYPE = setuptools

Could you add PYTHON_FLUP_LICENSE and PYTHON_FLUP_LICENSE_FILES ?

Other than that, looks good to me!

Thanks again,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
