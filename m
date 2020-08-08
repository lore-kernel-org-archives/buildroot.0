From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:19:20 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libcamera: needs faligned-new
In-Reply-To: <20200731221514.32623-1-ps.report@gmx.net>
References: <20200731221514.32623-1-ps.report@gmx.net>
Message-ID: <20200808181920.0aa3ea5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 00:15:13 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   - http://autobuild.buildroot.net/results/2db7292e251ce81d31187c3a9eb36dbc9236bd07
> 
>   ../src/libcamera/v4l2_videodevice.cpp: In member function 'int libcamera::V4L2VideoDevice::allocateBuffers(unsigned int, std::vector<std::unique_ptr<libcamera::FrameBuffer> >*)':
>   ../src/libcamera/v4l2_videodevice.cpp:1139:39: error: 'new' of type 'libcamera::V4L2BufferCache' with extended alignment 8 [-Werror=aligned-new=]
>    1139 |  cache_ = new V4L2BufferCache(*buffers);
>         |                                       ^
>   ../src/libcamera/v4l2_videodevice.cpp:1139:39: note: uses 'void* operator new(std::size_t)', which does not have an alignment parameter
>   ../src/libcamera/v4l2_videodevice.cpp:1139:39: note: use '-faligned-new' to enable C++17 over-aligned new support
>   ../src/libcamera/v4l2_videodevice.cpp: In member function 'int libcamera::V4L2VideoDevice::importBuffers(unsigned int)':
>   ../src/libcamera/v4l2_videodevice.cpp:1315:36: error: 'new' of type 'libcamera::V4L2BufferCache' with extended alignment 8 [-Werror=aligned-new=]
>    1315 |  cache_ = new V4L2BufferCache(count);
>         |                                    ^
>   ../src/libcamera/v4l2_videodevice.cpp:1315:36: note: uses 'void* operator new(std::size_t)', which does not have an alignment parameter
>   ../src/libcamera/v4l2_videodevice.cpp:1315:36: note: use '-faligned-new' to enable C++17 over-aligned new support
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libcamera/libcamera.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
