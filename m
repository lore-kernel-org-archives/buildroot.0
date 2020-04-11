From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:56:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/python3: add optional support
 for berkeleydb
In-Reply-To: <20200405142823.836514-2-bernd.kuhls@t-online.de>
References: <20200405142823.836514-1-bernd.kuhls@t-online.de>
 <20200405142823.836514-2-bernd.kuhls@t-online.de>
Message-ID: <20200411105618.0626ffa3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun,  5 Apr 2020 16:28:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
> +PYTHON3_DEPENDENCIES += berkeleydb
> +endif

For all Python modules that have external dependencies, we like to have
an option that allows to explicitly disable it:

0018-Add-an-option-to-disable-the-curses-module.patch
0019-Add-an-option-to-disable-expat.patch
0020-Add-an-option-to-disable-CJK-codecs.patch
0021-Add-an-option-to-disable-NIS.patch
0022-Add-an-option-to-disable-unicodedata.patch
0023-Add-an-option-to-disable-IDLE.patch
0024-Add-an-option-to-disable-decimal.patch
0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
0026-Add-an-option-to-disable-openssl-support.patch
0027-Add-an-option-to-disable-the-readline-module.patch
0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch

Could you add a similar patch to explicitly disable the build of the
dbm module when berkeleydb is not available, and then use that new
option in python3.mk ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
