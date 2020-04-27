From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 23:58:22 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/libtextstyle: new package
In-Reply-To: <20200421205504.3061551-1-aduskett@gmail.com>
References: <20200421205504.3061551-1-aduskett@gmail.com>
Message-ID: <20200427235822.56d30c15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Apr 2020 13:55:02 -0700
aduskett at gmail.com wrote:

> +LIBTEXTSTYLE_VERSION = 0.20.1

I've added a comment above this to ask this version to be kept in sync
with gettext-gnu.

> +LIBTEXTSTYLE_SITE = $(BR2_GNU_MIRROR)/gettext
> +LIBTEXTSTYLE_SOURCE = gettext-$(LIBTEXTSTYLE_VERSION).tar.xz
> +LIBTEXTSTYLE_INSTALL_STAGING = YES
> +LIBTEXTSTYLE_LICENSE = GPL-3.0+
> +LIBTEXTSTYLE_LICENSE_FILES = COPYING

I've added:

HOST_LIBTEXTSTYLE_DL_SUBDIR = gettext-gnu

so that the downloaded gettext tarball is shared with gettext-gnu.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
