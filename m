From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 3 Mar 2017 13:41:11 +0530
Subject: [Buildroot]  Qt5 CinematicExperience demo error on i.MX6Q
Message-ID: <CAD6G_RT4EY2zz3bFo8pUwHDN6fnWgG9CcXjUDuZEmAShRMmzhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Doe anyone tried Qt5 CinematicExperience demo? I've tried it on i.MX6Q
with 4.9.13 Mainline kernel but seems like egl surface issue.

Log:
----
# /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience -platform eglfs
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
EGL Error : Could not create the egl surface: error = 0x300b

Aborted

I'm using Mainline GPU drivers and enabled mesa 17.0.0 and etnaviv
gallium drivers on buildroot.

Kernel dmesg:
[    1.191267] [drm] Initialized
[    1.202685] etnaviv gpu-subsystem: bound 134000.gpu (ops gpu_ops)
[    1.208861] etnaviv gpu-subsystem: bound 130000.gpu (ops gpu_ops)
[    1.215055] etnaviv gpu-subsystem: bound 2204000.gpu (ops gpu_ops)
[    1.221284] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    1.276225] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    1.336244] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    1.342387] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    1.353868] imx-ipuv3 2400000.ipu: IPUv3H probed
[    1.361442] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.368068] [drm] No driver support for vblank timestamp query.
[    1.374738] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
ipu_crtc_ops)
[    1.382470] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
ipu_crtc_ops)
[    1.390299] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops
ipu_crtc_ops)
[    1.397993] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops
ipu_crtc_ops)
[    1.406215] imx-drm display-subsystem: bound 2000000.aips-bus:ldb
(ops imx_ldb_ops)
[    1.428173] imx-ipuv3 2400000.ipu: videomode adapted for IPU restrictions
[    1.428191] imx-ipuv3 2400000.ipu: videomode adapted for IPU restrictions
[    1.487123] Console: switching to colour frame buffer device 160x50
[    1.523393] imx-drm display-subsystem: fb0:  frame buffer device
[    1.561809] imx-ipuv3 2800000.ipu: IPUv3H probed

Please let me know your inputs.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
