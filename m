From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 19:59:01 +0100
Subject: [Buildroot] [PATCH 1/2] benejson: new package
In-Reply-To: <f49ab4cbca875dcec95fd436abfd3aa6acdea6fc.1422208637.git.yann.morin.1998@free.fr>
References: <cover.1422208637.git.yann.morin.1998@free.fr>
 <f49ab4cbca875dcec95fd436abfd3aa6acdea6fc.1422208637.git.yann.morin.1998@free.fr>
Message-ID: <20150125195901.0e9ce0f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 25 Jan 2015 18:57:42 +0100, Yann E. MORIN wrote:
> From: David Bender <codehero@yahoo.com>
> 
> Added C/C++ JSON parsing package benejson.
> 
> Signed-off-by: Dave Bender <bender@benegon.com>
> Signed-off-by: David Bender <codehero@gmail.com>
> [yann.morin.1998 at free.fr: fix static/shared install; enhance help entry;
>  fix extra space; add hash]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks, applied after doing minor changes (see below).

> +BENEJSON_VERSION = 0.9.7
> +BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
> +BENEJSON_LICENSE = MIT
> +BENEJSON_LICENSE_FILES = LICENSE
> +BENEJSON_INSTALL_STAGING = YES
> +
> +BENEJSON_DEPENDENCIES = host-scons
> +
> +BENEJSON_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS)

This variable is only used once, so I just removed its definition, and
used its value where it was used.

> +
> +define BENEJSON_BUILD_CMDS
> +	(cd $(@D); \
> +	 $(BENEJSON_SCONS_ENV) \
> +	 $(SCONS) \
> +	 $(BENEJSON_SCONS_OPTS) \

Indentation of one tab + one space is a bit weird, so I changed that to
two tabs. I also removed the reference to BENEJSON_SCONS_OPTS since
this variable was never defined.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
