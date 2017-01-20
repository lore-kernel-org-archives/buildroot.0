From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 13:22:25 +1100
Subject: [Buildroot] [PATCH v1] libsndfile: disable external library
 dependencies
In-Reply-To: <20170119201132.13641-1-ps.report@gmx.net>
References: <20170119201132.13641-1-ps.report@gmx.net>
Message-ID: <20170120132225.562d6313@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jan 2017 21:11:32 +0100, Peter Seiderer wrote:
> Fixes static linking of pifmrds [1]:
> 
> host/usr/bin/arm-linux-gcc -static -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lsndfile -lm
> .../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsndfile.a(flac.o): In function `sf_flac_error_callback':
>  flac.c:(.text+0x44c): undefined reference to `FLAC__StreamDecoderErrorStatusString'
> 
> host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsndfile.a(ogg.o): In function `ogg_close':
>  ogg.c:(.text+0x10): undefined reference to `ogg_sync_clear'
> 
> host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libsndfile.a(ogg_vorbis.o): In function `vorbis_read_sample':
> ogg_vorbis.c:(.text+0x26c): undefined reference to `vorbis_synthesis_pcmout'
> 
> [1] http://autobuild.buildroot.net/results/9b7/9b7638caa8f3e82e38fb68b0321cb649618a0131
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libsndfile/libsndfile.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
