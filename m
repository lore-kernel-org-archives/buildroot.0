From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:02:03 +0200
Subject: [Buildroot] [PATCH 7/8] package/python3-psutil: add a special
 host variant
In-Reply-To: <20200323104909.16765-7-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-7-yegorslists@googlemail.com>
Message-ID: <20200425140203.64c06def@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 11:49:08 +0100
yegorslists at googlemail.com wrote:

> diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
> index cfb015cfe6..b050547624 100644
> --- a/package/python-psutil/python-psutil.mk
> +++ b/package/python-psutil/python-psutil.mk
> @@ -11,8 +11,5 @@ PYTHON_PSUTIL_SETUP_TYPE = setuptools
>  PYTHON_PSUTIL_LICENSE = BSD-3-Clause
>  PYTHON_PSUTIL_LICENSE_FILES = LICENSE
>  
> -# Needed to build mongodb
> -HOST_PYTHON_PSUTIL_NEEDS_HOST_PYTHON = python3

I dropped this chunk, since I did not apply PATCH 1/8. I've however
added a comment in python-psutil.mk to tell that the version should be
kept in sync with python3-psutil.

> +# Please keep in sync with
> +# package/python-mako/python-psutil.mk
                   ^^^^^ should have been psutil

> +PYTHON3_PSUTIL_VERSION = 5.6.7
> +PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
> +PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/73/93/4f8213fbe66fc20cb904f35e6e04e20b47b85bee39845cc66a0bcf5ccdcb

I've updated the version and site to be in sync with python-psutil.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
