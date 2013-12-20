From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 17:02:42 +0100
Subject: [Buildroot] [PATCH v2 2/2] evemu: new package
In-Reply-To: <1387551924-4824-3-git-send-email-anaumann@ultratronik.de>
References: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
 <1387551924-4824-3-git-send-email-anaumann@ultratronik.de>
Message-ID: <20131220170242.09ee9540@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Fri, 20 Dec 2013 16:05:24 +0100, Andreas Naumann wrote:

> +EVEMU_VERSION = 1.0.10
> +EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
> +EVEMU_LICENSE = LGPLv3
> +EVEMU_LICENSE_FILES = COPYING

No, that's not correct. It should probably be something like:

EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
EVEMU_LICENSE_FILES = COPYING COPYING.GPL3

> +# Uses PKG_CHECK_MODULES() in configure.ac
> +EVEMU_DEPENDENCIES = host-pkgconf libevdev
> +# the package provides a autogen.sh, but we'd rather run buildroots autoreconf

Same comment as for PATCH 1/2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
