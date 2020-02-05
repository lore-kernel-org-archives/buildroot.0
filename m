From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:45:54 +0100
Subject: [Buildroot] [PATCH] package/gr-osmosdr: fix dependencies
In-Reply-To: <1580914682-11394-1-git-send-email-gwenj@trabucayre.com>
References: <1580914682-11394-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20200205164554.78333fdd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Feb 2020 15:58:02 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gr-osmosdr fails with:
> CMake Error at /somewhere/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/gnuradio/GnuradioConfig.cmake:116 (include):
>   include could not find load file:
> 
>     /somewhere/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/gnuradio/gnuradio-filterConfig.cmake
> Call Stack (most recent call first):
>   CMakeLists.txt:45 (find_package)
> 
> gr-osmosdr depends on BR2_PACKAGE_GNURADIO_BLOCKS, BR2_PACKAGE_GNURADIO_FFT and
> BR2_PACKAGE_GNURADIO_FILTER.

If it really needs these three features directly, we want gr-osmodr to
select all three options, not just one that happens to internally imply
the two others.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
