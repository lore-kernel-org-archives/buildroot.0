From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 22:44:22 +0100
Subject: [Buildroot] [PATCH/next 06/54] package/kodi: bump version to
 19.0-Matrix
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
 <20210220085913.888324-7-bernd.kuhls@t-online.de>
 <20210220110051.GJ2276@scaer>
Message-ID: <mec8ghx52u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Sat, 20 Feb 2021 12:00:51 +0100 schrieb Yann E. MORIN:

>> +Date: Sun, 1 Nov 2020 18:05:00 +0100 +Subject: [PATCH] Revert "[cmake]
>> FindWaylandpp: bail out if we cannot find + waylandpp via pkg-config"
>> +
>> +This reverts commit 767ff84dd222ff19996889942abf239d93fd940b.
> 
> Why? Please be mopre explicit: we'll have to maintain that patch, so we
> must now what breaks and why.

kodi configure can not detect wayland-scanner++ (host version is needed) 
when cross-compiling:

CMake Error at cmake/modules/FindWaylandpp.cmake:26 (message):
  wayland-scanner++ not found via pkg-config

Maybe another solution could be

 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
+KODI_CONF_OPTS += \
+       -DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
+       -DPC_WAYLANDPP_SCANNER_FOUND=ON

but I need to investigate this further.

Regards. Bernd
