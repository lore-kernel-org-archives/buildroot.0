From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 21:45:12 +0100
Subject: [Buildroot] [PATCH/next 1/3] python-pbr: new package
In-Reply-To: <20191125193850.862709-1-aduskett@gmail.com>
References: <20191125193850.862709-1-aduskett@gmail.com>
Message-ID: <20191225214512.65d2aca4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 11:38:48 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> PBR is a library that injects some useful and sensible default
> behaviors into a setuptools run.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>

Applied, with one minor change.

> +PYTHON_PBR_VERSION = 5.4.3
> +PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
> +PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/99/f1/7807d3409c79905a907f1c616d910c921b2a8e73c17b2969930318f44777
> +PYTHON_PBR_SETUP_TYPE = setuptools
> +PYTHON_PBR_LICENSE = BSD-3-Clause, Apache-2.0

Apache-2.0 is really the main license, BSD-3-Clause is only for the
test stuff, if I understood correctly. So I changed to:

PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
