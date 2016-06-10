From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 10:14:15 +0200
Subject: [Buildroot] [PATCH] python-dataproperty: fix package build
In-Reply-To: <1465545563-20130-1-git-send-email-yegorslists@googlemail.com>
References: <1465545563-20130-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160610101415.08180f14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 09:59:23 +0200, yegorslists at googlemail.com wrote:

> diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
> index 0bbe680..6d0c659 100644
> --- a/package/python-dataproperty/python-dataproperty.mk
> +++ b/package/python-dataproperty/python-dataproperty.mk
> @@ -11,4 +11,11 @@ PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
>  PYTHON_DATAPROPERTY_LICENSE = MIT
>  PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
>  
> +# DataProperty's setup.py requires test environment. So just comment this
> +# line as it is not required for normal installation
> +define PYTHON_DATAPROPERTY_COMMENT_SETUP_REQUIRES
> +	$(SED) '/setup_requires/ s/^#*/#/' $(@D)/setup.py
> +endef
> +PYTHON_DATAPROPERTY_POST_EXTRACT_HOOKS = PYTHON_DATAPROPERTY_COMMENT_SETUP_REQUIRES
> +
>  $(eval $(python-package))

I think I prefer a patch that this type of SED operation, especially
when there's only one occurrence to fix.

Also, is there an upstreamable approach to solve this problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
