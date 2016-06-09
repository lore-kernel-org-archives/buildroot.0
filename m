From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:15:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: select libvpx/x264
 for transcoding support
In-Reply-To: <1463505862-3783-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463505862-3783-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160610001520.62c9432e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 19:24:22 +0200, Bernd Kuhls wrote:
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
> ---
>  package/tvheadend/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
