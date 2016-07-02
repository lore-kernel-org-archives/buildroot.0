From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:38:15 +0200
Subject: [Buildroot] [PATCH v4 2/7] package/ffmpeg: bump to version 3.1.1
In-Reply-To: <1467466339-19422-2-git-send-email-bernd.kuhls@t-online.de>
References: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
 <1467466339-19422-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160702153815.58f45f35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:32:14 +0200, Bernd Kuhls wrote:
> From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> - Remove non-existing configure options:
>   - --disable-mips32r2
>   - --disable-libvo-aacenc
>   - --enable-libdcadec
>     (https://github.com/FFmpeg/FFmpeg/commit/e259dc86a80398d56d1aabcf6203f80616a4d04d)
> 
> - Amend renamed configure options:
>   - --disable-mipsdspr1 has been renamed to --disable-mipsdsp
> 
> Remove all Kodi-related patches according to upstream repo:
> https://github.com/xbmc/FFmpeg/commits/release/3.1-xbmc
> 
> Kodi now uses an unpatched ffmpeg.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

We're still a bit reluctant to upgrade ffmpeg to 3.x if there is no
released version of VLC that is ffmpeg 3.x compatible. What are the
main benefits of upgrading to ffmpeg 3.x ? Are there some other
packages you want to add that absolutely need ffmpeg in version 3.x ?

Of course, the removal of the ffmpeg patches is very nice, so we
definitely want to upgrade to ffmpeg 3.x at some point, but I'm not
sure we want to do that until VLC releases a compatible version. Do you
have an idea when VLC plans on making its 3.x release ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
