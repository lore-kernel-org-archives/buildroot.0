From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:55:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: add zlib dependency
In-Reply-To: <20201020103904.1529898-1-egorenar@linux.ibm.com>
References: <20201020103904.1529898-1-egorenar@linux.ibm.com>
Message-ID: <20201024225540.2dd1c3ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Oct 2020 12:39:04 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> zlib is required to build s390-tools and cannot be disabled for now
> due to libvmdump.
> 
> Fixes:
> 
> $BUILD_DIR/host/bin/s390x-buildroot-linux-gnu-g++ ... -c vmdump_convert.cpp -o vmdump_convert.o
> lkcd_dump.cpp:15:10: fatal error: zlib.h: No such file or directory
>    15 | #include <zlib.h>
>       |          ^~~~~~~~
> compilation terminated.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/s390-tools/Config.in     | 1 +
>  package/s390-tools/s390-tools.mk | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
