From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:44:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: Fix i586 compilation
 with gcc5
In-Reply-To: <1434829495-16711-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434829495-16711-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150705144434.3108aaa3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Jun 2015 21:44:55 +0200, Bernd Kuhls wrote:
> In file included from libavcodec/cabac_functions.h:46:0,
>                  from libavcodec/h264_cabac.c:37:
> libavcodec/h264_cabac.c: In function 'ff_h264_decode_mb_cabac':
> libavcodec/x86/cabac.h:192:5: error: 'asm' operand has impossible constraints
>      __asm__ volatile(
> 
> To reproduce the bug use this defconfig:
> 
> BR2_GCC_VERSION_5_1_X=y
> BR2_PACKAGE_FFMPEG=y
> BR2_PACKAGE_FFMPEG_GPL=y
> BR2_PACKAGE_FFMPEG_NONFREE=y
> BR2_PACKAGE_FFMPEG_FFPLAY=y
> BR2_PACKAGE_FFMPEG_FFSERVER=y
> BR2_PACKAGE_FFMPEG_FFPROBE=y
> BR2_PACKAGE_FFMPEG_AVRESAMPLE=y
> BR2_PACKAGE_FFMPEG_POSTPROC=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: bug only occurs with a i586 target cpu

Applied, thanks. Did you submit a bug report to ffmpeg upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
