From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:44:16 +0200
Subject: [Buildroot] [PATCH 2/2] python-falcon: new package
In-Reply-To: <20180828101618.4746-2-grzegorz@blach.pl>
References: <20180828101618.4746-1-grzegorz@blach.pl>
 <20180828101618.4746-2-grzegorz@blach.pl>
Message-ID: <20180829214416.3f0effe0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Tue, 28 Aug 2018 12:16:18 +0200, Grzegorz Blach wrote:
> An unladen web framework for building APIs and app backends.
> 
> http://falconframework.org
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

I've applied to next. Two nits below though.

>  N:	Grzegorz Blach <grzegorz@blach.pl>
> +F:	package/python-falcon

The final slash was missing here.

> +PYTHON_FALCON_VERSION = 1.4.1
> +PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
> +PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/2f/e6/5045da9df509b9259037f065d15608930fd6c997ee930ad230f9fbfecf15
> +PYTHON_FALCON_SETUP_TYPE = setuptools
> +PYTHON_FALCON_LICENSE_FILES = LICENSE

The PYTHON_FALCON_LICENSE variable was missing. Interestingly, it was
present in your first version of the patch, but following Yegor's
review, you re-did the package using scanpypi, and scanpypi didn't add
the license information.

Yegor: could you tweak scanpypi so that it warns if no licensing
information could be added to the package ? Perhaps it should even in
this case generate something like:

PYTHON_FALCON_LICENSE = FIXME before submitting

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
