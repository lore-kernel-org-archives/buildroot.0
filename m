From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 23:30:03 +0200
Subject: [Buildroot] bug in xserver compilation?
In-Reply-To: <trinity-5c752dae-1ff7-4dbc-8baa-935b9342af4a-1469739383586@3capp-mailcom-bs07>
References: <trinity-5c752dae-1ff7-4dbc-8baa-935b9342af4a-1469739383586@3capp-mailcom-bs07>
Message-ID: <20160728233003.4ce258a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 22:56:23 +0200, daggs wrote:

> I'm trying to add a new ddx driver to buildroot from aarch64 and I've encountered a strange issue.
> so I've decided to try and reproduce it with are more stable env, Iv'e ran make pc_x86_64_bios_defconfig, then entered menuconfig.
> in it I've enable c++ support, modular xserver and finally the intel xf86 video.
> I've hit make and waited, when buildroot got to xserver. it failed with the following error more than once:
> /home/dagg/workspace/buildroots/buildroot-master3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/xf86drm.h:40:17: fatal error: drm.h: No such file or directory
>  #include <drm.h>

This is a known issue. Bernd posted a patch to fix it "[PATCH 1/2]
package/x11r7/xserver_xorg-server: add libdrm-specific cflags" but I
wasn't happy with it. You can see my reply from this Monday in the
mailing list archives.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
