From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:41:41 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-imx: bump version to 0.13.0
In-Reply-To: <20171110194320.12812-1-alexandre.esse.dev@gmail.com>
References: <20171110194320.12812-1-alexandre.esse.dev@gmail.com>
Message-ID: <20171111234141.2b76e5af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Nov 2017 20:43:20 +0100, Alexandre Esse wrote:
> Changelog:
> 
> ==== version 0.13.0 (2017-11-01) ====
> 
> * New imxv4l2videosink element
>   Currently only supports input physically contiguous memory blocks
>   as input (so, for example, no videotestsrc)
> 
> * New Pango-based overlay elements using G2D for rendering
> 
> * gstimxcommon library is now public
>   Necessary when implementing external sinks to retrieve the mapped
>   physical memory address from gstreamer buffers
>   (NOTE: ABI may change in the next few releases until this is stabilized)
> 
> * New optional ability to use GstPhysMemory from gst-plugins-bad
> 
> * imxv4l2videosrc:
>   * Fix compile prior to Gstreamer 1.3.1
>   * v4l2_buffer_pool: Add special case for tw6869 driver
>     The tw6869 driver requires a different physical address to allow
>     DMA'able buffers for decreasing latency between chip and display
>   * v4l2src: add fractional "fps" property
>     (obsoletes the "fps-n" property)
>   * Add GstImxV4l2Meta init function
>     This avoids the g_assert() that was caused by the missing init
>     function
>   * Add num-additional-buffers property
>     This can be useful if capturing video isn't smooth; it sets the
>     number of internal additional buffers, so if downstream consumes
>     too many buffers, imxv4l2videosrc might end up doing a blocking
>     wait until buffers are returned
> 
> * imxv4l2src plugin is now called imxv4l2video, because it also
>   contains imxv4l2videosink
>   Also, the v4l2 elements can be enabled/disabled in the build
>   configuration individually now
> 
> * compositor:
>   * Only copy compositor input buffers to DMA memory once
>     If a single input frame is used for multiple output frames, we would
>     otherwise copy multiple times which can easily go to the limit of the
>     memory bandwidth
> 
> * vpu:
>   * Handle releasing of buffers without assigned framebuffer
>     This can happen if the buffer is released before it was actually
>     used, e.g. when renegotiating at the very beginning; prevents
>     a crash that would otherwise occur
>   * Add parameter check to avoid encoder crash on flush
> 
> * g2d:
>   * Add build configuration switches to explicitely specify G2D include
>     and library paths
>   * Disable cacheable memory allocation
>     Several issues were reported with cacheable DMA memory, so it is
>     turned off, at least for now
> 
> * blitter:
>   * Add property to clear screen to black in blitter sinks
>   * Add output-rotation property to videotransform base class
> 
> * audio:
>   * Fix reference counting for caps
>   * Mark static codec caps as may be leaked
>     This gets rid of the false positive in the leak tracer
> 
> Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
> ---
>  package/gstreamer1/gst1-imx/gst1-imx.hash | 2 +-
>  package/gstreamer1/gst1-imx/gst1-imx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
