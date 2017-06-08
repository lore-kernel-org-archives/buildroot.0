From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:36:48 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-stalker: fix gcc7
 compile
In-Reply-To: <20170513182944.29833-1-bernd.kuhls@t-online.de>
References: <20170513182944.29833-1-bernd.kuhls@t-online.de>
Message-ID: <20170608233648.5e0722fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 20:29:44 +0200, Bernd Kuhls wrote:

> diff --git a/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
> new file mode 100644
> index 0000000000..54d18a996c
> --- /dev/null
> +++ b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
> @@ -0,0 +1,33 @@
> +From bb16ccd14deb3a01049daec37b6d2e7711ef4738 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 13 May 2017 20:22:08 +0200
> +Subject: [PATCH 1/1] src/CWatchdog.h: Fix gcc7 build

Please use [PATCH] instead of [PATCH 1/1], i.e use git format-patch -N.

> +Building with gcc7 is broken:
> +
> +src/CWatchdog.h:31:58: error: 'std::function' has not been declared
> +    CWatchdog(unsigned int interval, SAPI *api, std::function<void(SError)> errorCallback);
> +                                                     ^~~~~~~~
> +
> +Patch sent upstream as PR 93.

A link is better than "PR 93".

I've fixed both, and applied, after also adjusting DOS line endings as
you mentioned (I tested that the patch applies properly).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
