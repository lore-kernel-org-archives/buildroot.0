From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:06:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: needs uuid
In-Reply-To: <20210716210106.342232-1-fontaine.fabrice@gmail.com>
References: <20210716210106.342232-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716230617.135b52e1@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 16 Jul 2021 23:01:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build of nfs-utils without uuid is broken since bump to version 2.5.4 in
> commit 0ce30de72fb303768c5865949b8ce9260d0c43f5 because of
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6

A bug should be reported upstream: the configure script should be
checking for the existence of libuuid, and not hardcode -luuid.

> -ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
>  NFS_UTILS_CONF_OPTS += --enable-uuid

Why do they still have a --enable-uuid / --disable-uuid option if uuid
is now mandatory anyway ?

It feels like the change from upstream is not quite complete :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
