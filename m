From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 2 Mar 2018 12:41:52 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to
 3.4.2
In-Reply-To: <20180212165106.18383-1-bernd.kuhls@t-online.de>
References: <20180212165106.18383-1-bernd.kuhls@t-online.de>
Message-ID: <c1e58daa-5aa5-1974-d51f-2549c90ec5ed@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 12/02/2018 ? 17:51, Bernd Kuhls a ?crit?:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.hash | 2 +-
>  package/ffmpeg/ffmpeg.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
> index cdf740834b..a8092616a9 100644
> --- a/package/ffmpeg/ffmpeg.hash
> +++ b/package/ffmpeg/ffmpeg.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256 5a77278a63741efa74e26bf197b9bb09ac6381b9757391b922407210f0f991c0  ffmpeg-3.4.1.tar.xz
> +sha256 2b92e9578ef8b3e49eeab229e69305f5f4cbc1fdaa22e927fc7fca18acccd740  ffmpeg-3.4.2.tar.xz
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>  sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
>  sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 76c31f5f52..5d2f89fb43 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FFMPEG_VERSION = 3.4.1
> +FFMPEG_VERSION = 3.4.2

The new libavcodec v4l2 support introduced by ffmpeg 3.4 needs threads support.

https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1ef7752d64cbe9af2f27cc65aba3a2ca3831c128

Adding --disable-v4l2_m2m fix the issue but the v4l2 support must not be enabled
in the first place if --disable-pthreads is used.

See:
http://autobuild.buildroot.org/?reason=ffmpeg-3.4.2

Can you take a look ?

Best regards,
Romain

>  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
>  FFMPEG_SITE = http://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
> 
