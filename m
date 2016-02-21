From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 16:03:31 +0100
Subject: [Buildroot] [PATCH v4 1/2] libimxvpuapi: add new package
In-Reply-To: <1455712071-14629-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1455712071-14629-1-git-send-email-gary.bisson@boundarydevices.com>
 <1455712071-14629-2-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160221160331.4bc2f8fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Wed, 17 Feb 2016 13:27:50 +0100, Gary Bisson wrote:
> This is a library for using the i.MX6 VPU. It is an alternative to
> libfslvpuwrap, hosted on Github, and has an API that features several
> improvements over libfslvpuwrap, which include:
> 
> * User-defined context information associated with input frames, which
> is passed on to corresponding output frames (to be able to identify
> which input frame produced which output frame)
> * Groundwork for future DMA-BUF/BMM/ION/CMA allocator integration, using
> file descriptors instead of physical addresses
> * Indicators for when it is safe to try to decode frames, which is
> critical in multi-threaded playback cases
> * Simplified, higher-level JPEG en/decoding API, based on the VPU MJPEG
> codec; useful for picture viewing without the extra boilerplate for
> VPU-based en/decoding
> 
> Changelog 0.10.0 -> 0.10.1:
> - add debian packaging files
> - update waf to version 1.8.16
> - add workaround in wscript to prevent stale pkg-config .pc files
> - fix memory leak by adding missing IOFreeVirtMem() call in vpulib
> backend
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/e519d6c
> https://github.com/Freescale/meta-fsl-arm/commit/1dd6a5b
> 
> This package has been implicitely tested through gstreamer as the
> plugins rely on it for vpu decoding:
>  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
> 
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
