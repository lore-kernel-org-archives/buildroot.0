From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jul 2016 23:04:11 +0200
Subject: [Buildroot] bug in xserver compilation?
In-Reply-To: <trinity-5c752dae-1ff7-4dbc-8baa-935b9342af4a-1469739383586@3capp-mailcom-bs07>
References: <trinity-5c752dae-1ff7-4dbc-8baa-935b9342af4a-1469739383586@3capp-mailcom-bs07>
Message-ID: <20160728210411.GH5862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dagg, All,

On 2016-07-28 22:56 +0200, daggs spake thusly:
> I'm trying to add a new ddx driver to buildroot from aarch64 and I've encountered a strange issue.
> so I've decided to try and reproduce it with are more stable env, Iv'e ran make pc_x86_64_bios_defconfig, then entered menuconfig.
> in it I've enable c++ support, modular xserver and finally the intel xf86 video.
> I've hit make and waited, when buildroot got to xserver. it failed with the following error more than once:
> /home/dagg/workspace/buildroots/buildroot-master3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/xf86drm.h:40:17: fatal error: drm.h: No such file or directory
>  #include <drm.h>

The xdriver_xf86-video-intel was updated just tonight. Did you observe
the build failure before it was updated, or after it was?

Regards,
Yann E. MORIN.

> I've ran a sanity check on the output dir:
> dagg at NCC-5001-D ~/workspace/buildroots/buildroot-master3 $ find output/ -name drm.h
> output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/drm/drm.h
> output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/libdrm/drm.h
> output/build/libdrm-2.4.70/include/drm/drm.h
> output/build/linux-headers-4.6.3/usr/include/drm/drm.h
> output/build/linux-headers-4.6.3/drivers/gpu/drm/tegra/drm.h
> output/build/linux-headers-4.6.3/include/uapi/drm/drm.h
> output/target/usr/include/libdrm/drm.h
> 
> I think this is a bug, am I wrong?
> 
> the actual config I've used can be found at http://bpaste.net/show/45998ef4aed6
> 
> Dagg.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
