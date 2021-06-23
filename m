From: C Larbi <pkl2000us@gmail.com>
Date: Wed, 23 Jun 2021 11:33:06 +0000
Subject: [Buildroot] Running wpewebkit with fdo backend raspberry pi 4
Message-ID: <CANVomh-j5cEtVJ55rrpFQhO9WFa4H75CXqgHHJrzmNTUiMnoxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.
I have been battling with issues concerning wpewebkit.
I switched to this platform from Webkitgtk hoping to improve the
performance of my application.

My wpewebkit app reports a shameless 2fps in performance

The issues with webkitgtk seem to persist, and i think the problem may be
from my graphics stack.

i am using the stable release of buildroot 2021.02.x

i have kmscube installed and it runs fine when i type
*> kmscube*
on the command line ( No arguments required).

The output from kmscube is below:






















*Using display 0xe03808 with EGL version
1.4===================================EGL information:  version: "1.4"
vendor: "Mesa Project"  client extensions: "EGL_EXT_client_extensions
EGL_EXT_device_base EGL_EXT_device_enumeration EGL_EXT_device_query
EGL_EXT_platform_base EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug
EGL_EXT_platform_device EGL_EXT_platform_wayland EGL_KHR_platform_wayland
EGL_MESA_platform_gbm EGL_KHR_platform_gbm EGL_MESA_platform_surfaceless"
display extensions: "EGL_ANDROID_blob_cache EGL_EXT_buffer_age
EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers
EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
EGL_KHR_create_context_no_error EGL_KHR_fence_sync
EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace
EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image
EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_image
EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config_context
EGL_KHR_reusable_sync EGL_KHR_surfaceless_context
EGL_EXT_pixel_format_float EGL_KHR_wait_sync EGL_MESA_configless_context
EGL_MESA_drm_image EGL_MESA_image_dma_buf_export EGL_MESA_query_driver
EGL_WL_bind_wayland_display "===================================OpenGL ES
2.x information:  version: "OpenGL ES 3.1 Mesa 20.3.5"  shading language
version: "OpenGL ES GLSL ES 3.10"  vendor: "Broadcom"  renderer: "V3D 4.2"
extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays
GL_EXT_texture_compression_s3tc GL_EXT_texture_compression_dxt1
GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_texture
GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap
GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives
GL_OES_stencil8 GL_OES_texture_3D GL_OES_texture_float
GL_OES_texture_half_float GL_OES_texture_half_float_linear
GL_OES_texture_npot GL_OES_vertex_half_float GL_EXT_draw_instanced
GL_EXT_texture_sRGB_decode GL_OES_EGL_image GL_OES_depth_texture
GL_OES_packed_depth_stencil GL_EXT_texture_type_2_10_10_10_REV
GL_OES_get_program_binary GL_APPLE_texture_max_level
GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_EXT_frag_depth
GL_NV_fbo_color_attachments GL_OES_EGL_image_external GL_OES_EGL_sync
GL_OES_vertex_array_object GL_ANGLE_pack_reverse_row_order
GL_ANGLE_texture_compression_dxt3 GL_ANGLE_texture_compression_dxt5
GL_EXT_occlusion_query_boolean GL_EXT_texture_rg GL_EXT_unpack_subimage
GL_NV_draw_buffers GL_NV_read_buffer GL_NV_read_depth
GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_draw_buffers
GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_texture_compression_astc_ldr
GL_NV_pixel_buffer_object GL_OES_depth_texture_cube_map
GL_OES_required_internalformat GL_OES_surfaceless_context
GL_EXT_color_buffer_float GL_EXT_sRGB_write_control
GL_EXT_separate_shader_objects GL_EXT_shader_implicit_conversions
GL_EXT_shader_integer_mix GL_EXT_base_instance
GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_draw_elements_base_vertex
GL_EXT_primitive_bounding_box GL_EXT_shader_io_blocks
GL_EXT_texture_border_clamp GL_KHR_context_flush_control
GL_NV_image_formats GL_OES_draw_elements_base_vertex
GL_OES_primitive_bounding_box GL_OES_shader_io_blocks
GL_OES_texture_border_clamp GL_OES_texture_stencil8
GL_OES_texture_storage_multisample_2d_array GL_EXT_buffer_storage
GL_EXT_float_blend GL_EXT_geometry_point_size GL_EXT_geometry_shader
GL_KHR_no_error GL_KHR_texture_compression_astc_sliced_3d
GL_OES_EGL_image_external_essl3 GL_OES_geometry_point_size
GL_OES_geometry_shader GL_OES_shader_image_atomic
GL_EXT_texture_compression_s3tc_srgb GL_MESA_shader_integer_functions
GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage
GL_MESA_framebuffer_flip_y GL_EXT_texture_query_lod
"===================================Rendered 120 frames in 2.001666 sec
(59.950071 fps)Rendered 240 frames in 4.003359 sec (59.949664 fps)Rendered
360 frames in 6.005052 sec (59.949520 fps)Rendered 480 frames in 8.006742
sec (59.949477 fps)Rendered 600 frames in 10.008435 sec (59.949435
fps)Rendered 720 frames in 12.010126 sec (59.949410 fps)Rendered 840 frames
in 14.011818*

This i presume means i have the right mesa drivers installed

When i launch cog from the weston-terminal, i get the following output:






















































*(cog:285): GLib-GIO-DEBUG: 00:01:23.978: _g_io_module_get_default: Found
default implementation local (GLocalVfs) for ?gio-vfs?** (cog:285): DEBUG:
00:01:23.985: platform_setup: Platform name: fdo** (cog:285): DEBUG:
00:01:23.985: platform_setup: Platform plugin:
libcogplatform-fdo.so(cog:285): Cog-FDO-DEBUG: 00:01:23.995: Initializing
Wayland...(cog:285): Cog-FDO-DEBUG: 00:01:23.996: Using 'wl_compositor'
interface obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG:
00:01:23.996: Using 'wl_subcompositor' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.997: Ignoring 'wp_viewporter'
interface obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG:
00:01:23.997: Ignoring 'zxdg_output_manager_v1' interface obtained from the
Wayland registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.997: Using
'wp_presentation' interface obtained from the Wayland registry.(cog:285):
Cog-FDO-DEBUG: 00:01:23.997: Ignoring 'zwp_relative_pointer_manager_v1'
interface obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG:
00:01:23.997: Ignoring 'zwp_pointer_constraints_v1' interface obtained from
the Wayland registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.997: Ignoring
'zwp_input_timestamps_manager_v1' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.997: Ignoring
'wl_data_device_manager' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.997: Using 'wl_shm' interface
obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998:
Ignoring 'wl_drm' interface obtained from the Wayland registry.(cog:285):
Cog-FDO-DEBUG: 00:01:23.998: Using 'wl_seat' interface obtained from the
Wayland registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998: Ignoring
'zwp_linux_dmabuf_v1' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998: Ignoring
'weston_direct_display_v1' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998: Ignoring
'weston_content_protection' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998: Using 'wl_output'
interface obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG:
00:01:23.998: Ignoring 'zwp_input_panel_v1' interface obtained from the
Wayland registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998: Ignoring
'zwp_input_method_v1' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.998: Using
'zwp_text_input_manager_v1' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.999: Using 'xdg_wm_base'
interface obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG:
00:01:23.999: Ignoring 'zxdg_shell_v6' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.999: Using 'wl_shell' interface
obtained from the Wayland registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.999:
Ignoring 'weston_desktop_shell' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.999: Ignoring
'weston_screenshooter' interface obtained from the Wayland
registry.(cog:285): Cog-FDO-DEBUG: 00:01:23.999: Initializing
EGL...Cog-FDO-INFO: 00:01:24.142: EGL version 1.4 initialized.(cog:285):
Cog-FDO-DEBUG: 00:01:24.143: Creating Wayland surface...xkbcommon: ERROR:
couldn't find a Compose file for locale "C"** (cog:285): DEBUG:
00:01:24.151: platform_setup: Platform = 0x5e1c20(cog:285): Cog-FDO-DEBUG:
00:01:24.251: Enumerating seat capabilities:(cog:285): Cog-FDO-DEBUG:
00:01:24.252:   - Keyboard(cog:285): Cog-FDO-DEBUG: 00:01:24.252: Done
enumerating seat capabilities.(cog:285): Cog-FDO-DEBUG: 00:01:24.252: Seat
name: 'default'Cog-FDO-INFO: 00:01:24.252: Got scale factor 1 for output
0x607ad8(cog:285): Cog-FDO-DEBUG: 00:01:24.280: New XDG toplevel
configuration: (0, 0)(cog:285): Cog-FDO-DEBUG: 00:01:24.281: Resized EGL
buffer to: (1024, 768) @1x(process:291): GLib-GIO-DEBUG: 00:01:24.294:
Failed to initialize portal (GNetworkMonitorPortal) for
gio-network-monitor: Not using portals(process:291): GLib-GIO-DEBUG:
00:01:24.309: Failed to initialize networkmanager (GNetworkMonitorNM) for
gio-network-monitor: NetworkManager not running(process:291):
GLib-GIO-DEBUG: 00:01:24.310: _g_io_module_get_default: Found default
implementation netlink (GNetworkMonitorNetlink) for
?gio-network-monitor?(process:291): GLib-GIO-DEBUG: 00:01:24.314:
_g_io_module_get_default: Found default implementation local (GLocalVfs)
for ?gio-vfs?Cog-Message: 00:01:25.155: <file:///myapp/web_2/home.html>
Load started.(cog:285): Cog-FDO-DEBUG: 00:01:25.157: Surface entered output
0x607ad8 with scale factor 1(cog:285): Cog-FDO-DEBUG: 00:01:25.157: New XDG
toplevel configuration: (0, 0)(cog:285): Cog-FDO-DEBUG: 00:01:25.157:
Resized EGL buffer to: (1024, 768) @1xCog-Message: 00:01:25.199:
<file:///myapp/web_2/home.html> Loading...Cog-Message: 00:01:25.554:
<file:///myapp/web_2/home.html> Loaded successfully.*

Could any one please decipher these logs as to why i do not seem to get
hardware acceleration from my application
Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210623/3c11f35d/attachment.html>
