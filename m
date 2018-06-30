From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 21:16:29 +0200
Subject: [Buildroot] [PATCH 3/5 v2] package/xorriso: fix to use the
 system xattr header
In-Reply-To: <6c7d039a9b5c4bcd728e3061be1bab895bd29ad5.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <6c7d039a9b5c4bcd728e3061be1bab895bd29ad5.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <20180630211629.411d671b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 16:21:25 +0200, Yann E. MORIN wrote:

> +# 0001-use-sys-xattr.h.patch
> +XORRISO_DEPENDENCIES = host-pkgconf

Why do you need host-pkgconf ? For autoreconf to work fine ? If so, why
isn't it also needed for host-xorriso ?

> +XORRISO_AUTORECONF = YES
> +HOST_XORRISO_AUTORECONF = YES

HOST_<pkg>_AUTORECONF gets derived from <pkg>_AUTORECONF, so
HOST_XORRISO_AUTORECONF = YES doesn't seem to be very useful.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
