From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 3 Mar 2017 12:22:01 +0530
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RQ3bLbJGi2jdRB-mafn4s=iHpvscjP+ggdBQG7_570ECA@mail.gmail.com>
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
 <CAD6G_RSOBrZvE-4O_6uTj+0pBvsrM56p-48Rxd2hQZHtq8XkGw@mail.gmail.com>
 <CAOMZO5CBQVEMBLNgWRL947_uRpCDbyy5tTUVBfNjMkiwjyoA4Q@mail.gmail.com>
 <CAD6G_RQ3bLbJGi2jdRB-mafn4s=iHpvscjP+ggdBQG7_570ECA@mail.gmail.com>
Message-ID: <CAD6G_RT58-HC8mi2g7Aq0x72uac0mUTA=HgoMAd1uAB-BWrXEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 3, 2017 at 12:11 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
>
> On Mar 3, 2017 12:06 AM, "Fabio Estevam" <festevam@gmail.com> wrote:
>
> On Thu, Mar 2, 2017 at 3:32 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
>> [   87.631131] ------------[ cut here ]------------
>> [   87.635799] WARNING: CPU: 2 PID: 275 at
>> drivers/gpu/drm/drm_atomic_helper.c:1149
>> drm_atomic_helper_wait_for_vblanks+0x218/0x228
>> [   87.647319] [CRTC:26] vblank wait timed out
>
> I think Phillip Zabel posted a recent series to address this issue 4.10
> issue.
>
> Does kmscube work on 4.9.13 for you?

No, still same.

# cat /proc/version
Linux version 4.9.13 (root at 261fc421fda2) (gcc version 4.9.0 (GCC) ) #1
SMP Fri Mar 3 05:56:41 UTC 2017
# kmscube
trying to load module exynos...failed.
trying to load module i915...failed.
trying to load module imx-drm...success.
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
Using display 0x606548 with EGL version 1.4
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
^C[   63.353491] imx-ipuv3 2400000.ipu: videomode adapted for IPU restrictions
[   63.360573] imx-ipuv3 2400000.ipu: videomode adapted for IPU restrictions

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
