From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 3 Mar 2017 00:02:02 +0530
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RQNzT_yQfQeHW-VNE3vAhSnCRStc1R2NHrbkJwtHD=mzA@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
 <CAAMH-ys=MpSuBvT=weVPKhyu5_bz4feq7ePmMN4LgHKubG_9vQ@mail.gmail.com>
 <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
 <CAOMZO5B_d9-oq9R1NciG7F3A-HKhHVWP8uXzM=Crx2YB+zFVnw@mail.gmail.com>
 <CAD6G_RQZuqQphZqB0QwLKBC2Ox5G_tp06WTfUMEuOL6=LA2UvQ@mail.gmail.com>
 <CAOMZO5BWQvPFNevSp8Hjz4knfQ7kTYGmgXutoyzvb_ejq5AhpA@mail.gmail.com>
 <CAD6G_RSC9+NwdQP3qRA=wLWm2SaVNeN=zJXVR6P6dk8i+xLbxg@mail.gmail.com>
 <CAOMZO5BGTbB8WM-+oS9CoC8_3TPsZhyq1t-3=SJk1uAms8jBmQ@mail.gmail.com>
 <CAD6G_RRfwho6qwBU=QtyR6AsuNtGgWvvSFbTjwLwzv+9dqA6-Q@mail.gmail.com>
 <CAOMZO5Acb8RJZdf95uGj8w5LyhnjCh=sZoj=NE24wN_K2nO_OQ@mail.gmail.com>
 <CAD6G_RQNzT_yQfQeHW-VNE3vAhSnCRStc1R2NHrbkJwtHD=mzA@mail.gmail.com>
Message-ID: <CAD6G_RSOBrZvE-4O_6uTj+0pBvsrM56p-48Rxd2hQZHtq8XkGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 2, 2017 at 11:58 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> On Thu, Mar 2, 2017 at 11:37 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> On Thu, Mar 2, 2017 at 3:06 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>>
>>> Linux version 4.10.0-rc8-next-20170217-00002-g5c07a3d-dirty
>>
>> Well, not a very stable kernel base :-)
>>
>> I would recommend you to trying 4.9.13 or 4.10.1.
>
> Yeah, I've tried 4.10.1 same issue but some how bigger red flash
> compared to previous.
>
>
> Log:
> # cat /proc/version
> Linux version 4.10.1 (root at d7d7e20b645f) (gcc version 4.9.0 (GCC) ) #1
> SMP Thu Mar 2 18:23:17 UTC 2017
> # kmscube
> trying to load module exynos...failed.
> trying to load module i915...failed.
> trying to load module imx-drm...success.
> MESA-LOADER: device is not located on the PCI bus
> MESA-LOADER: device is not located on the PCI bus
> MESA-LOADER: device is not located on the PCI bus
> Using display 0x105a398 with EGL version 1.4
> EGL Version "1.4 (DRI2)"
> EGL Vendor "Mesa Project"
> EGL Extensions "EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import
> EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
> EGL_KHR_fence_sync EGL_K
> HR_get_all_proc_addresses EGL_KHR_gl_renderbuffer_image
> EGL_KHR_gl_texture_2D_image EGL_KHR_gl_texture_cubemap_image
> EGL_KHR_image EGL_KHR_image_base EG
> L_KHR_image_pixmap EGL_KHR_no_config_context EGL_KHR_reusable_sync
> EGL_KHR_surfaceless_context EGL_KHR_wait_sync
> EGL_MESA_configless_context EGL_MESA_dr
> m_image EGL_MESA_image_dma_buf_export "
> GL Extensions: "(null)"

I've some more verbose info on another display.

Log:
----
# cat /proc/version
Linux version 4.10.1 (root at d7d7e20b645f) (gcc version 4.9.0 (GCC) ) #1
SMP Thu Mar 2 18:23:17 UTC 2017
# kmscube
trying to load module exynos...failed.
trying to load module i915...failed.
trying to load module imx-drm...success.
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
Using display 0x922398 with EGL version 1.4
EGL Version "1.4 (DRI2)"
EGL Vendor "Mesa Project"
EGL Extensions "EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import
EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
EGL_KHR_fence_sync EGL_K
HR_get_all_proc_addresses EGL_KHR_gl_renderbuffer_image
EGL_KHR_gl_texture_2D_image EGL_KHR_gl_texture_cubemap_image
EGL_KHR_image EGL_KHR_image_base EG
L_KHR_image_pixmap EGL_KHR_no_config_context EGL_KHR_reusable_sync
EGL_KHR_surfaceless_context EGL_KHR_wait_sync
EGL_MESA_configless_context EGL_MESA_dr
m_image EGL_MESA_image_dma_buf_export "
GL Extensions: "(null)"
[   87.631131] ------------[ cut here ]------------
[   87.635799] WARNING: CPU: 2 PID: 275 at
drivers/gpu/drm/drm_atomic_helper.c:1149
drm_atomic_helper_wait_for_vblanks+0x218/0x228
[   87.647319] [CRTC:26] vblank wait timed out
[   87.651536] Modules linked in:
[   87.654610] CPU: 2 PID: 275 Comm: kmscube Tainted: G        W       4.10.1 #1
[   87.661751] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   87.668282] Backtrace:
[   87.670753] [<c010c490>] (dump_backtrace) from [<c010c738>]
(show_stack+0x18/0x1c)
[   87.678333]  r6:60070013 r5:00000000 r4:c0e29318 r3:00000000
[   87.684006] [<c010c720>] (show_stack) from [<c03fe09c>]
(dump_stack+0xb4/0xe8)
[   87.691241] [<c03fdfe8>] (dump_stack) from [<c0126114>] (__warn+0xd8/0x104)
[   87.698212]  r10:00000000 r9:c04d3e50 r8:0000047d r7:00000009
r6:c0c1ea40 r5:00000000
[   87.706048]  r4:ee4ffc98 r3:00000000
[   87.709633] [<c012603c>] (__warn) from [<c0126180>]
(warn_slowpath_fmt+0x40/0x48)
[   87.717126]  r9:ee832018 r8:00000000 r7:ee831800 r6:ee514400
r5:ee4d3c40 r4:c0c1eb5c
[   87.724880] [<c0126144>] (warn_slowpath_fmt) from [<c04d3e50>]
(drm_atomic_helper_wait_for_vblanks+0x218/0x228)
[   87.734973]  r3:0000001a r2:c0c1eb5c
[   87.738552]  r4:00000000
[   87.741101] [<c04d3c38>] (drm_atomic_helper_wait_for_vblanks) from
[<c0500574>] (imx_drm_atomic_commit_tail+0x50/0x60)
[   87.751805]  r10:ee4ffe58 r9:ef33a020 r8:ee089140 r7:ee831800
r6:00000000 r5:ee831800
[   87.759638]  r4:ee4d3c40
[   87.762182] [<c0500524>] (imx_drm_atomic_commit_tail) from
[<c04d4530>] (commit_tail+0x4c/0x94)
[   87.770886]  r5:c0e3a4e8 r4:ee4d3c40
[   87.774474] [<c04d44e4>] (commit_tail) from [<c04d659c>]
(drm_atomic_helper_commit+0xd0/0x1ac)
[   87.783090]  r5:00000000 r4:ee4d3c40
[   87.786680] [<c04d64cc>] (drm_atomic_helper_commit) from
[<c04f4bb8>] (drm_atomic_commit+0x54/0x60)
[   87.795732]  r7:ee4ffdd8 r6:ee831800 r5:ee4d3c40 r4:00000000
[   87.801402] [<c04f4b64>] (drm_atomic_commit) from [<c04d6b98>]
(drm_atomic_helper_set_config+0x80/0xd0)
[   87.810801]  r6:ee832018 r5:00000000 r4:ee4d3c40 r3:00000004
[   87.816476] [<c04d6b18>] (drm_atomic_helper_set_config) from
[<c04e91cc>] (drm_mode_set_config_internal+0x60/0xe4)
[   87.826831]  r7:ee089140 r6:eebe4000 r5:ee832018 r4:ee0c09c0
[   87.832501] [<c04e916c>] (drm_mode_set_config_internal) from
[<c04e9b08>] (drm_mode_setcrtc+0x434/0x498)
[   87.841987]  r7:ee089140 r6:eebe4000 r5:ee831800 r4:00000001
[   87.847656] [<c04e96d4>] (drm_mode_setcrtc) from [<c04e1624>]
(drm_ioctl+0x21c/0x458)
[   87.855495]  r10:c06864a2 r9:ee515a00 r8:c0a40420 r7:00000068
r6:ee4ffe58 r5:00000068
[   87.863329]  r4:00000000
[   87.865877] [<c04e1408>] (drm_ioctl) from [<c0235608>]
(do_vfs_ioctl+0x98/0xa2c)
[   87.873282]  r10:00000000 r9:ee4fe000 r8:c0235fd8 r7:00000003
r6:ee45d540 r5:ef31b768
[   87.881115]  r4:bed94ab0
[   87.883661] [<c0235570>] (do_vfs_ioctl) from [<c0235fd8>]
(SyS_ioctl+0x3c/0x64)
[   87.890978]  r10:00000000 r9:ee4fe000 r8:00000003 r7:c06864a2
r6:ee45d540 r5:bed94ab0
[   87.898812]  r4:ee45d540
[   87.901359] [<c0235f9c>] (SyS_ioctl) from [<c0107ea0>]
(ret_fast_syscall+0x0/0x1c)
[   87.908937]  r8:c0108044 r7:00000036 r6:c06864a2 r5:00000003
r4:bed94ab0 r3:00000001
[   87.916798] ---[ end trace 7f71ee8af7dd698c ]---


thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
