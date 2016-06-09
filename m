From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jun 2016 23:01:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: select libvpx/x264
 for transcoding support
In-Reply-To: <1463505862-3783-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463505862-3783-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160609210132.GB3826@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-05-17 19:24 +0200, Bernd Kuhls spake thusly:
> ffmpeg needs libvpx and x264 to support transcoding.
> 
> Fixes this error message from tvheadend log:
> 2016-05-14 22:52:21.962 [  ERROR]:transcode: 0006: Unable to find libx264 encoder
> 2016-05-14 22:52:21.962 [   INFO]:transcode: 0006: 1:H264 ==> Passthrough
> 2016-05-14 22:52:21.963 [   INFO]:transcode: 0006: 2:MPEG2AUDIO ==> AAC (aac)
> 
> or
> 
> 2016-05-14 22:58:01.529 [  ERROR]:transcode: 0009: Unable to find libvpx encoder
> 2016-05-14 22:58:01.529 [   INFO]:transcode: 0009: 1:H264 ==> Passthrough
> 2016-05-14 22:58:01.529 [   INFO]:transcode: 0009: 2:MPEG2AUDIO ==> VORBIS (libvorbis)
> 
> With this patch transcoding is logged like this:
> 
> 2016-05-16 20:14:56.515 [   INFO]:transcode: 0004: 1:TELETEXT ==> Filtered
> 2016-05-16 20:14:56.516 [   INFO]:transcode: 0004: 2:MPEG2VIDEO 720x576 ==> H264 640x512 (libx264)
> 2016-05-16 20:14:56.516 [   INFO]:transcode: 0004: 3:MPEG2AUDIO ==> AAC (aac)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 67a4b14..b274a13 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_TVHEADEND
>  	select BR2_PACKAGE_DTV_SCAN_TABLES
>  	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_LIBVPX if BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_X264 if BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_OPENSSL
>  	help
> -- 
> 2.8.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
