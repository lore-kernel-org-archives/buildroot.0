From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 18:05:10 +0100
Subject: [Buildroot] [PATCH 06/19] python-mistune: new package
In-Reply-To: <1454373899-22481-7-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-7-git-send-email-mc5686@mclink.it>
Message-ID: <20160202180510.54ca024b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Tue,  2 Feb 2016 01:44:46 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                          |  1 +
>  package/python-mistune/Config.in           |  8 ++++++++
>  package/python-mistune/python-mistune.hash |  3 +++
>  package/python-mistune/python-treq.mk      | 14 ++++++++++++++

This file name is wrong.


> diff --git a/package/python-mistune/Config.in b/package/python-mistune/Config.in
> new file mode 100644
> index 0000000..dd56815
> --- /dev/null
> +++ b/package/python-mistune/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_MISTUNE
> +	bool "python-mistune"
> +	help
> +	  The fastest markdown parser in pure Python 

There's a trailing white space here.

> +	  with renderer features, inspired by marked.

and the wrapping is not good. You should use 72 columns.

> +
> +	  https://pypi.python.org/pypi/mistune
> +

Excessive empty new line here.

> +PYTHON_MISTUNE_VERSION = 0.7.1
> +PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
> +PYTHON_MISTUNE_SITE = http://pypi.python.org/packages/source/m/mistune
> +PYTHON_MISTUNE_LICENSE = BSD

License is BSD-3c. You should generally never use BSD as the license,
but only BSD-2c, BSD-3c or BSD-4c depending on the variant being used
by the project.

I've applied with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
