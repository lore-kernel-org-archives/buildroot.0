From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 19 Oct 2011 23:31:44 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compiling on ARM by adjusting
	the offset to correct value (compiling with NEON still needs
	manual optimization flags to be set to -mfpu=neon)
In-Reply-To: <1319058110-31518-1-git-send-email-damian@veritymedical.co.uk>
References: <1319058110-31518-1-git-send-email-damian@veritymedical.co.uk>
Message-ID: <201110192331.44237.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damian, All,

On Wednesday 19 October 2011 23:01:50 Damian Kaczmarek wrote:

Summary line too long, too. Something like:
  mplayer: fix compilation on ARM

And a more dewcriptive commit message:

  Adjust offset blabla (complete it, I don;t really know what you
  mean here...)

> Signed-off-by: Damian Kaczmarek <damian@veritymedical.co.uk>
> ---
>  .../mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch   |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch
> 
> diff --git a/package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch b/package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch
> new file mode 100644
> index 0000000..2072c37
> --- /dev/null
> +++ b/package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch

Patches should have a description and a Signed-off-by line as if they
were a commit, too.

> @@ -0,0 +1,11 @@
> +--- mplayer-32726.orig/ffmpeg/libavcodec/arm/asm-offsets.h	2011-10-19 14:52:46.729779445 +0200
> ++++ mplayer-32726/ffmpeg/libavcodec/arm/asm-offsets.h	2011-10-19 14:50:52.095779444 +0200
> +@@ -35,7 +35,7 @@
> + #define AC_PRED                  0xae0
> + #define BLOCK_LAST_INDEX         0x21c0
> + #define INTER_SCANTAB_RASTER_END 0x23c0
> +-#define H263_AIC                 0x2670
> ++#define H263_AIC                 0x2678
> + #elif defined(__APPLE__)
> + #define Y_DC_SCALE               0xa70
> + #define C_DC_SCALE               0xa74

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
