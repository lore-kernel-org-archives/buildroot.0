From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:37:26 +0200
Subject: [Buildroot] [PATCH v7 07/31] package/kodi-texturepacker: new
 host package
In-Reply-To: <20170429083751.19625-8-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-8-bernd.kuhls@t-online.de>
Message-ID: <20170429113726.7686d765@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:27 +0200, Bernd Kuhls wrote:

>  package/kodi-texturepacker/kodi-texturepacker.hash |  1 +
>  package/kodi-texturepacker/kodi-texturepacker.mk   | 41 ++++++++++++++++++++++

I've moved to this commit the move of the Kodi texture packer patch.


> +KODI_TEXTUREPACKER_LICENSE = GPLv2

Changed to use SPDX license code.

> +KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.GPL
> +HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
> +HOST_KODI_TEXTUREPACKER_DEPENDENCIES += \

+= not needed here.

> +HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
> +	"$(HOST_CXXFLAGS) \
> +	-std=c++0x \
> +	-DTARGET_POSIX \
> +	-DTARGET_LINUX \
> +	-D_LINUX \
> +	-I$(@D)/xbmc/linux"

We generally don't put the double quotes here, but rather...

> +
> +HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS=$(HOST_KODI_TEXTUREPACKER_CXXFLAGS) \

... here. So I've changed that as well.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
