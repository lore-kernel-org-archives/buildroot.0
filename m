From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jun 2016 22:33:54 +0200
Subject: [Buildroot] [PATCH v5] package/python-pillow: new package
References: <1465850289-11760-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <iund4dxdb3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

like you I was surprised that this package is not yet part of buildroot, 
so let's get things moving ;) I need it because the OpenWeather addon for 
Kodi needs it:

File "//.kodi/addons/script.openweathermap.maps/default.py", line 4, in 
<module>
from PIL import Image
ImportError: No module named PIL

Am Mon, 13 Jun 2016 22:38:09 +0200 schrieb Angelo Compagnucci:

> +From 3344eff32427f1d10f3ca82ca4344c501a1a2055 Mon Sep 17 00:00:00 2001
> +From: Angelo Compagnucci
> <angelo.compagnucci@gmail.com>
> +Date: Sun, 12 Jun 2016 12:06:59 +0200 +Subject: [PATCH] setup.py: add
> option to disable platform guessing +
> +When cross-compiling (ex on Buildroot) platform guessing is not needed
> +cause the environment is correctly built externally.
> +This patch adds an option to disable platform guessing on Linux.
> +---

s-o-b missing.

Also apparently you send a patch fixing cross-compilation upstream:
https://github.com/python-pillow/Pillow/pull/1861

The patch you included here seems to be a smaller version of your 
original patch which itself got extended by upstream:
https://github.com/python-pillow/Pillow/pull/1875

Could you please check if the patch from PR 1875 could be included in 
buildroot instead of the current patch? This will make bumping the 
package easier if PR 1875 gets merged some time in the future.

Besides these cosmetical things the package compiles.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Compile-tested using these defconfigs:

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_PILLOW=y

and

BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PILLOW=y

Both defconfigs were based on http://autobuild.buildroot.net/toolchains/
configs/br-x86-64-core2-full.config

Regards, Bernd
