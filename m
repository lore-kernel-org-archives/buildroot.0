From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:57:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add optional dependency
 to libxcb
In-Reply-To: <20200405145207.1258663-1-bernd.kuhls@t-online.de>
References: <20200405145207.1258663-1-bernd.kuhls@t-online.de>
Message-ID: <20200411105757.63b0801f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 16:52:07 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> ffmpeg 3.3 added optional support for libxcb:
> https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/HEAD:/Changelog#l282
> 
> This patch ensures a reproducable build of libavdevice.so:
> 
> $ readelf -a output/target/usr/lib/libavdevice.so | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libavfilter.so.7]
>  0x0000000000000001 (NEEDED)             Shared library: [libavformat.so.58]
>  0x0000000000000001 (NEEDED)             Shared library: [libavcodec.so.58]
>  0x0000000000000001 (NEEDED)             Shared library: [libavutil.so.56]
>  0x0000000000000001 (NEEDED)             Shared library: [libxcb.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libxcb-shm.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libxcb-shape.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libxcb-xfixes.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
> 
> compared to
> 
> $ readelf -a output/target/usr/lib/libavdevice.so | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libavfilter.so.7]
>  0x0000000000000001 (NEEDED)             Shared library: [libavformat.so.58]
>  0x0000000000000001 (NEEDED)             Shared library: [libavcodec.so.58]
>  0x0000000000000001 (NEEDED)             Shared library: [libavutil.so.56]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/Config.in |  7 +++++++
>  package/ffmpeg/ffmpeg.mk | 11 +++++++++++
>  2 files changed, 18 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
