From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 2 Mar 2017 23:26:34 +0530
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAOMZO5B_d9-oq9R1NciG7F3A-HKhHVWP8uXzM=Crx2YB+zFVnw@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
 <CAAMH-ys=MpSuBvT=weVPKhyu5_bz4feq7ePmMN4LgHKubG_9vQ@mail.gmail.com>
 <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
 <CAOMZO5B_d9-oq9R1NciG7F3A-HKhHVWP8uXzM=Crx2YB+zFVnw@mail.gmail.com>
Message-ID: <CAD6G_RQZuqQphZqB0QwLKBC2Ox5G_tp06WTfUMEuOL6=LA2UvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Thu, Mar 2, 2017 at 10:52 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Mar 2, 2017 at 2:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
>> I've built GPU drivers as well, please see below kernel dmesg.
>>
>> dmesg:
>> ---------
>> [    1.002652] console [ttymxc3] enabled
>> [    1.016395] etnaviv gpu-subsystem: bound 134000.gpu (ops gpu_ops)
>
> I see you are using the mainline kernel.
>
> You need to install mesa 17.0.0 and etnaviv gallium drivers (they are
> available in the master branch now).
>
> Then you can use kmscube for a quick test to check everything was
> properly installed.

This is what the kmscube log shows, used the patch [1]

# kmscube
trying to load module exynos...failed.
trying to load module i915...failed.
trying to load module imx-drm...success.
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
Using display 0x1efa398 with EGL version 1.4
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


[1] https://patchwork.ozlabs.org/patch/728156/

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
