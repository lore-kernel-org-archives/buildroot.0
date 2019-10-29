From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 29 Oct 2019 18:56:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump to v1.2
In-Reply-To: <20191029174122.97086-1-titouan.christophe@railnova.eu>
References: <20191029174122.97086-1-titouan.christophe@railnova.eu>
Message-ID: <e5f99201-9f28-1e02-a3de-d87460ae1ad6@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Titouan,

Le 29/10/2019 ? 18:41, Titouan Christophe a ?crit?:
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>   package/rauc/rauc.hash | 4 ++--
>   package/rauc/rauc.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index ad4f74409e..54760347c7 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated, after verifying against
> -# https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
> -sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
> +# https://github.com/rauc/rauc/releases/download/v1.2/rauc-1.2.tar.xz.asc
> +sha256 224683fc1fac50ccb89128aa786445cd8e26bb25deafd4410e0807187376e661 rauc-1.2.tar.xz
>   sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 88a1006bc0..9edd9d466c 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RAUC_VERSION = 1.1
> +RAUC_VERSION = 1.2
>   RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>   RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>   RAUC_LICENSE = LGPL-2.1
> 

Since commit in [1], we need to add dbus in
RAUC_DEPENDENCIES, otherwise the build fails
with the following issue:

checking for Valgrind tool drd... drd
checking for Valgrind tool exp-sgcheck... exp-sgcheck
checking pkg-config is at least version 0.9.0... yes
checking for DBUS1... no
configure: error: Package requirements (dbus-1) were not met:
Package 'dbus-1', required by 'virtual:world', not found

This issue was found with 'test-pkg'.

Thanks !

Pierre-Jean

[1] - 
https://github.com/rauc/rauc/commit/7698cadcbbd0db63877a2947b1d6b9cc7b556f58
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
