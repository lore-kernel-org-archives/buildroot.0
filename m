From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 3 Mar 2017 16:49:52 +0530
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RT58-HC8mi2g7Aq0x72uac0mUTA=HgoMAd1uAB-BWrXEQ@mail.gmail.com>
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
 <CAD6G_RT58-HC8mi2g7Aq0x72uac0mUTA=HgoMAd1uAB-BWrXEQ@mail.gmail.com>
Message-ID: <CAD6G_RQ_00ozMXZJ4GaTR5ETny-wJk6GkHbPSHLGQjiHUJR9dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Fri, Mar 3, 2017 at 12:22 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> On Fri, Mar 3, 2017 at 12:11 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>>
>>
>> On Mar 3, 2017 12:06 AM, "Fabio Estevam" <festevam@gmail.com> wrote:
>>
>> On Thu, Mar 2, 2017 at 3:32 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>>
>>> [   87.631131] ------------[ cut here ]------------
>>> [   87.635799] WARNING: CPU: 2 PID: 275 at
>>> drivers/gpu/drm/drm_atomic_helper.c:1149
>>> drm_atomic_helper_wait_for_vblanks+0x218/0x228
>>> [   87.647319] [CRTC:26] vblank wait timed out
>>
>> I think Phillip Zabel posted a recent series to address this issue 4.10
>> issue.
>>
>> Does kmscube work on 4.9.13 for you?
>
> No, still same.
>
> # cat /proc/version
> Linux version 4.9.13 (root at 261fc421fda2) (gcc version 4.9.0 (GCC) ) #1
> SMP Fri Mar 3 05:56:41 UTC 2017
> # kmscube
> trying to load module exynos...failed.
> trying to load module i915...failed.
> trying to load module imx-drm...success.
> MESA-LOADER: device is not located on the PCI bus
> MESA-LOADER: device is not located on the PCI bus
> MESA-LOADER: device is not located on the PCI bus
> Using display 0x606548 with EGL version 1.4
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
> ^C[   63.353491] imx-ipuv3 2400000.ipu: videomode adapted for IPU restrictions
> [   63.360573] imx-ipuv3 2400000.ipu: videomode adapted for IPU restrictions

Got the cube running..

Log:
----
# kmscube
trying to load module exynos...failed.
trying to load module i915...failed.
trying to load module imx-drm...success.
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
MESA-LOADER: device is not located on the PCI bus
Using display 0x1258ef8 with EGL version 1.4
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
GL Extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays
GL_EXT_texture_filter_anisotropic GL_EXT_texture_format_BGRA8888
GL_OES_compressed_ETC1_RGB
8_texture GL_OES_depth24 GL_OES_element_index_uint
GL_OES_fbo_render_mipmap GL_OES_mapbuffer GL_OES_rgb8_rgba8
GL_OES_standard_derivatives GL_OES_stenci
l8 GL_OES_texture_3D GL_OES_texture_npot GL_OES_vertex_half_float
GL_OES_EGL_image GL_OES_depth_texture GL_OES_packed_depth_stencil
GL_EXT_texture_type_
2_10_10_10_REV GL_OES_get_program_binary GL_APPLE_texture_max_level
GL_EXT_discard_framebuffer GL_EXT_read_format_bgra
GL_NV_fbo_color_attachments GL_OE
S_EGL_image_external GL_OES_EGL_sync GL_OES_vertex_array_object
GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buffer
GL_NV_read_depth GL_NV_read_
depth_stencil GL_NV_read_stencil GL_EXT_draw_buffers
GL_EXT_map_buffer_range GL_KHR_debug GL_OES_surfaceless_context
GL_EXT_separate_shader_objects GL_E
XT_draw_elements_base_vertex GL_EXT_texture_border_clamp
GL_KHR_context_flush_control GL_OES_draw_elements_base_vertex
GL_OES_texture_border_clamp "

Missing openGL libs in previous build.

Thank you!

-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
