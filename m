From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 20:29:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump to version
 57d601e82089f2f31de9e1683c3834f237421f5d
In-Reply-To: <20190204190015.30321-1-fontaine.fabrice@gmail.com>
References: <20190204190015.30321-1-fontaine.fabrice@gmail.com>
Message-ID: <20190205202947.53a89b0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 20:00:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> When building statically zbar, build fails on:
> configure: error: unable to find libv4l.so
> 
> The following errors are raised in config.log:
> configure:19371:
> /home/buildroot/buildroot-test/instance-0/output/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g2  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lv4l2 -lpthread  >&5
> /home/buildroot/buildroot-test/instance-0/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libv4l2.a(libv4l2_la-libv4l2.o): In function `v4l2_set_src_and_dest_format':
> /home/buildroot/buildroot-test/instance-0/output/build/libv4l-1.16.2/lib/libv4l2/libv4l2.c:952: undefined reference to `v4lconvert_supported_dst_format'
> 
> To fix this error, bump to version
> 57d601e82089f2f31de9e1683c3834f237421f5d to replace AC_CHECK_LIB by
> PKG_CHECK_MODULES to find the correct library (-lv4lconvert but also
> -ljpeg, ...)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/acf39e4754508d7ee49e21f08ff0a1fcac4fb7cd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zbar/zbar.hash | 2 +-
>  package/zbar/zbar.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
