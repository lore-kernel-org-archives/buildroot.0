From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Sep 2019 11:47:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: disable opencl
In-Reply-To: <20190823191417.8748-1-juju@cotds.org>
References: <20190823191417.8748-1-juju@cotds.org>
Message-ID: <20190924114722.2578c41b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Aug 2019 21:14:17 +0200
Julien Olivain <juju@cotds.org> wrote:

> Some packages installs libOpenCL without declaring
> BR2_PACKAGE_PROVIDES_LIBOPENCL (e.g. imx-gpu-viv). ImageMagick will
> detect the library and will require libtool. Since libtool is not in
> dependencies, build might fail.
> 
> To prevent that situation, this patch explicitly disable opencl
> support.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>

FYI, I've started looking into this. First, there is an upstream commit
that fixes using disable_opencl instead of enable_opencl. Then I fixed
up the configure.ac to use the "no_cl" variable that the OpenCL M4
macro defines. But then even with --disable-opencl, the build fails
because MAGICKCORE__OPENCL is defined. I'm still trying to figure out
why.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
