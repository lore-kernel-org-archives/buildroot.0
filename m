From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:02:18 +0200
Subject: [Buildroot] [PATCH 21/23] python-pyhamcrest: new package
In-Reply-To: <20180926153505.3411-22-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-22-asafka7@gmail.com>
Message-ID: <20181004140218.3f5cd4bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Sep 2018 18:35:03 +0300, Asaf Kahlon wrote:
> Hamcrest framework for matcher objects.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/python-pyhamcrest/Config.in              |  8 ++++++++
>  package/python-pyhamcrest/python-pyhamcrest.hash |  5 +++++
>  package/python-pyhamcrest/python-pyhamcrest.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-pyhamcrest/Config.in
>  create mode 100644 package/python-pyhamcrest/python-pyhamcrest.hash
>  create mode 100644 package/python-pyhamcrest/python-pyhamcrest.mk

I've applied to master with Yegor Reviewed-by. However, I have a
question, see below.

> +config BR2_PACKAGE_PYTHON_PYHAMCREST
> +	bool "python-pyhamcrest"
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime

How do you know, or how does scanpypi knows when setuptools is needed
on the target vs. when it's only needed at build time on the build
machine ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
