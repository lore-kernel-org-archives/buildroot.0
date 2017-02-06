From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:20:54 +0100
Subject: [Buildroot] [PATCHv2] imagemagick: fix build of png support
 when jpeg support is disabled
In-Reply-To: <20170206170255.19487-1-peter@korsgaard.com>
References: <20170206170255.19487-1-peter@korsgaard.com>
Message-ID: <20170206192054.06cef3ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 18:02:55 +0100, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d20/d20eecec8e7b947759185f77a6c8e610dd7393f3/
> http://autobuild.buildroot.net/results/ee1/ee15efa8ae3f95244980810155ff7ba9f885a59d/
> http://autobuild.buildroot.net/results/aa8/aa80f2fd4c7dd884ea8a1b55ad15a40c7bf40501/
> http://autobuild.buildroot.net/results/9aa/9aaa044f78115d7f599ea09669c0d6bface5633e/
> 
> This combination is broken since 7.0.4-6.
> 
> Since commit a9e228f8ac26 (Implemented a private PNG caNv (canvas) chunk),
> PNGsLong gets called unconditionally, but it is only defined if JPEG
> support is enabled (which defines JNG_SUPPORTED), breaking the build:
> 
> MagickCore/.libs/libMagickCore-7.Q16HDRI.a(MagickCore_libMagickCore_7_Q16HDRI_la-png.o): In function `WriteOnePNGImage':
> png.c:(.text+0x748d): undefined reference to `PNGsLong'
> png.c:(.text+0x74b7): undefined reference to `PNGsLong'
> 
> Fix it by adding a patch unconditionally defining the helper function.
> 
> Patch submitted upstream.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Changes since v1:
>  - Add link to upstream pull request

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
