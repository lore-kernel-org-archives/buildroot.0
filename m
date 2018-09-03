From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 3 Sep 2018 22:32:24 +0200
Subject: [Buildroot] [PATCH v2] mediastreamer: fix avcodec functions
 conflict
In-Reply-To: <20180903191442.57819-1-giulio.benetti@micronovasrl.com>
References: <20180903191442.57819-1-giulio.benetti@micronovasrl.com>
Message-ID: <c66a80a9-2715-17d0-09d3-189b0cf88aef@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 03/09/2018 21:14, Giulio Benetti ha scritto:
> Autotools miss avcodec function check leading to conflicts between local
> functions and avcodec functions.
> 
> Add patch to append -ldrm to FFMPEG_LIBS which are checked when
> AC_CHECK_LIB on avcodec_* functions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/394/3945e06ea0dd1e16013184fbab5b67b3561c87ce/
> http://autobuild.buildroot.net/results/576/576c7d71313c45753848462717200b2b8ff5bb0e/
> http://autobuild.buildroot.net/results/f33/f339ac6ea30815eeb8ecb144c971f56c06a9f995
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> * merge -ldrm into FFMPEG_LIBS instead of repeating it thrice.

Sorry I did it too much of a hurry.
It's not about -lavcodec but -lavutil and it's better to swap
$FFMPEG_LIBS and -lavutil this way:
from this:
FFMPEG_LIBS="$FFMPEG_LIBS -lavutil"
to this:
FFMPEG_LIBS="-lavutil $FFMPEG_LIBS"

This way -ldrm is contained in $FFMPEG_LIBS, after -lavutil(the library 
which needs -ldrm).

I wait for other comments before submittin v3.

Sorry again

Best regards
Giulio Benetti
