From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:31:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/x264: disable optional ffmpeg
 support
In-Reply-To: <20170605162238.8413-1-bernd.kuhls@t-online.de>
References: <20170605162238.8413-1-bernd.kuhls@t-online.de>
Message-ID: <20170620223141.255a2c41@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 18:22:37 +0200, Bernd Kuhls wrote:
> In buildroot ffmpeg uses x264 as optional dependency if
> BR2_PACKAGE_FFMPEG_GPL is enabled at the same time.
> 
> If BR2_PACKAGE_FFMPEG_GPL is disabled and ffmpeg is built without x264
> support before x264 itself is build, x264 picks up certain ffmpeg libs
> as optional dependency leading to build errors because x264 does not
> correctly link statically against ffmpeg.
> 
> To avoid a circular dependency and to avoid teaching x264 how to
> correctly link statically with ffmpeg we just disable all ffmpeg-
> related options.
> 
> Fixes
> http://autobuild.buildroot.net/results/36a/36abb5b8f3aab57fb7b63056b216b4a58143ee3e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x264/x264.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks. On the second patch, you forgot to update
the hash, so I've done so. You probably forgot because back then, we
were not checking the hashes of git-downloaded packages. But now we
are, so hashes should be correct.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
