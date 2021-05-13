From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 May 2021 14:36:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.0.2
In-Reply-To: <20210407214228.GB359705@scaer>
References: <20210407173125.27246-1-bernd.kuhls@t-online.de>
 <20210407214228.GB359705@scaer>
Message-ID: <fb6b49c4-e5db-fe1e-530b-9fe7d3a2e84a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 07/04/2021 ? 23:42, Yann E. MORIN a ?crit?:
> Bernd, All,
> 
> On 2021-04-07 19:31 +0200, Bernd Kuhls spake thusly:
>> Release notes:
>> 21.0.0: https://lists.freedesktop.org/archives/mesa-announce/2021-March/000622.html
>> 21.0.1: https://lists.freedesktop.org/archives/mesa-announce/2021-March/000624.html
>> 21.0.2: https://lists.freedesktop.org/archives/mesa-announce/2021-April/000625.html
>>
>> OSMesa classic support was removed:
>> https://cgit.freedesktop.org/mesa/mesa/commit/?h=21.0&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4
>>
>> DRI swrast driver was removed:
>> https://cgit.freedesktop.org/mesa/mesa/commit/?h=21.0&id=435de835cd639d1b9bb96f81fc224771dc90af6d
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> The OSMesa option renaming back-n-forth was confusing. Besides, we want
> to keep the legacy options as long as it makes sense (about 5 years).
> 
> So, I've renamed the new option with a _GALLIUM suffix, and adapted the
> rest accordingly.

The BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST option is still used in the tree

$ git grep BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST

configs/minnowboard_max-graphical_defconfig
support/testing/tests/package/test_glxinfo.py

I'll check for test_glxinfo test.

Best regards,
Romain

> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>> v3: bump version to 21.0.2
>> v2: - osmesa needs swrast driver (Yann)
>>     - updated other packages following the renamed osmesa Config.in
>>       option (Yann)
>>
