From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:00:24 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/linphone: remove
 ffmpeg-related patches
In-Reply-To: <20171217135346.925-1-bernd.kuhls@t-online.de>
References: <20171217135346.925-1-bernd.kuhls@t-online.de>
Message-ID: <20171218100024.05e1b6f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 14:53:46 +0100, Bernd Kuhls wrote:
> The linphone package never provided video support.
> 
> While this commit
> https://git.buildroot.net/buildroot/commit/package/linphone?id=dec04466549cd40e2696ae7725e90d6559bee640
> 
> added support for ffmpeg 3.0+ the next commit, which fixed the build of
> the bundled mediastreamer2 library, added --disable-video:
> https://git.buildroot.net/buildroot/commit/package/linphone?id=f3492b28d89c1f2448c9662a6f755cb48e8c0f0b
> 
> At this point the ffmpeg 3.0 patches could have been removed because
> ffmpeg is only used if video support is enabled:
> 
> https://github.com/BelledonneCommunications/mediastreamer2/blob/6c2a608800a221942f2a827e0abb60346e7d065f/acinclude.m4#L80
> https://github.com/BelledonneCommunications/mediastreamer2/blob/6c2a608800a221942f2a827e0abb60346e7d065f/acinclude.m4#L107
> 
> This patch catches up on that to avoid changing the upstream URL for
> the patches which is broken.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: removed unneeded ffmpeg patches instead of using
>     http://snapshot.debian.org/archive/debian/20161118T211932Z/pool/main/l/linphone
>     as proposed by Thomas.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
