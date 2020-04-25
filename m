From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 11:59:54 +0200
Subject: [Buildroot] [PATCH 6/8] package/python3-pyyaml: add special
 host variant
In-Reply-To: <20200323104909.16765-6-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-6-yegorslists@googlemail.com>
Message-ID: <20200425115954.28c664b7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 11:49:07 +0100
yegorslists at googlemail.com wrote:

>  package/python3-pyyaml/python3-pyyaml.hash |  1 +
>  package/python3-pyyaml/python3-pyyaml.mk   | 20 ++++++++++++++++++++

I've modified python-pyyaml.mk to indicate that its version should stay
in sync with python3-pyyaml.

> +# Please keep in sync with
> +# package/python-pyyaml/python-pyyaml.mk
> +PYTHON3_PYYAML_VERSION = 5.3
> +PYTHON3_PYYAML_SOURCE = PyYAML-$(PYTHON3_PYYAML_VERSION).tar.gz
> +PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/3d/d9/ea9816aea31beeadccd03f1f8b625ecf8f645bd66744484d162d84803ce5

Updated to use the same version as python-pyyaml, i.e version 5.3.1.

> +PYTHON3_PYYAML_SETUP_TYPE = distutils
> +PYTHON3_PYYAML_LICENSE = MIT
> +PYTHON3_PYYAML_LICENSE_FILES = LICENSE
> +PYTHON3_PYYAML_DEPENDENCIES = libyaml

This line was not needed, since there is no target version of
python3-pyyaml, so I dropped this line.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
