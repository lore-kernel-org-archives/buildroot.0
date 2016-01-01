From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 1 Jan 2016 07:27:06 +0200
Subject: [Buildroot] [PATCH] python-smbus-cffi: new package
In-Reply-To: <1451599710-7304-1-git-send-email-yegorslists@googlemail.com>
References: <1451599710-7304-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160101052706.GH1990@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Thu, Dec 31, 2015 at 11:08:30PM +0100, Yegor Yefremov wrote:
> +config BR2_PACKAGE_PYTHON_SMBUS_CFFI
> +	bool "python-smbus-cffi"
> +	select BR2_PACKAGE_PYTHON_CFFI

You don't add python-cffi to <pkg>_DEPENDENCIES below. Is this a run-time 
dependency? If so please add a comment to clarify that.

[snip]

> +PYTHON_SMBUS_CFFI_VERSION = 0.5.1
> +PYTHON_SMBUS_CFFI_SOURCE = smbus-cffi-$(PYTHON_SMBUS_CFFI_VERSION).tar.gz
> +PYTHON_SMBUS_CFFI_SITE = https://pypi.python.org/packages/source/s/smbus-cffi
> +PYTHON_SMBUS_CFFI_SETUP_TYPE = setuptools
> +PYTHON_SMBUS_CFFI_LICENSE = GPLv2+
> +PYTHON_SMBUS_CFFI_LICENSE_FILES = LICENSE
> +PYTHON_SMBUS_CFFI_DEPENDENCIES = host-python-cffi
> +
> +$(eval $(python-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
