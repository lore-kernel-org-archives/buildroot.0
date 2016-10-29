From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 16:02:39 +0200
Subject: [Buildroot] [PATCH 1/2] python-jsonschema: new package
In-Reply-To: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161029160239.4ce7e48b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 20:25:34 +0200, Fabrice Fontaine wrote:

> +PYTHON_JSONSCHEMA_VERSION = 2.5.1
> +PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
> +PYTHON_JSONSCHEMA_SITE = \
> +	https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
> +PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
> +PYTHON_JSONSCHEMA_LICENSE = MIT
> +PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))

Is there a motivation to add the target variant of this package? Your
patch 2/2 seems to be using only the host variant of python-jsonschema.
Am I missing something, or are you just adding the target variant just
because it can also be useful to other people?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
