From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:10:37 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/kodi-skin-confluence: new
 package
In-Reply-To: <20170429203608.17700-1-bernd.kuhls@t-online.de>
References: <20170429203608.17700-1-bernd.kuhls@t-online.de>
Message-ID: <20170504211037.54389e3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 22:36:07 +0200, Bernd Kuhls wrote:
> +KODI_SKIN_CONFLUENCE_VERSION = 7044dabb3a818d7ff47b7a34bfb3480f2a9441d9
> +KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
> +KODI_SKIN_CONFLUENCE_LICENSE = GPLv2+

You should use SPDX license codes, and GPLv2+ is not a valid SPDX
license code.

In addition, I didn't see anything in the source code that says "or
later". So I've changed this to GPL-2.0.

> +KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
> +KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
> +KODI_SKIN_CONFLUENCE_CONF_OPTS = -DOVERRIDE_PATHS=1

This is not used anywhere in your package... it's a generic-package.

Applied with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
