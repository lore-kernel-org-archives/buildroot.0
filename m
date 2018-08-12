From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:51:05 +0200
Subject: [Buildroot] [PATCH/next 5/6] package/motion: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180812203205.7251-5-bernd.kuhls@t-online.de>
References: <20180812203205.7251-1-bernd.kuhls@t-online.de>
 <20180812203205.7251-5-bernd.kuhls@t-online.de>
Message-ID: <20180812235105.5ffbd143@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 22:32:04 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/motion/0001-ffmpeg40.patch | 57 ++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/motion/0001-ffmpeg40.patch
> 
> diff --git a/package/motion/0001-ffmpeg40.patch b/package/motion/0001-ffmpeg40.patch
> new file mode 100644
> index 0000000000..f3cdfa93b4
> --- /dev/null
> +++ b/package/motion/0001-ffmpeg40.patch
> @@ -0,0 +1,57 @@
> +From ff99988d57f4bcb0a7b381374f8106896bda2b15 Mon Sep 17 00:00:00 2001
> +From: James Cowgill <jcowgill@jcowgill.uk>
> +Date: Fri, 23 Feb 2018 23:04:33 +0000
> +Subject: [PATCH] Fix build errors with FFmpeg 4.0
> +
> +Downloaded from
> +https://sources.debian.org/src/motion/4.1.1-1.1/debian/patches/ffmpeg4.0.patch/
> +
> +Instead of backporting
> +https://github.com/Motion-Project/motion/commit/9b93a417e37e1f0fef58d1582a7e98e4c05d3b42
> +from upstream master branch we use the patch from Debian.

Why ? Backporting from upstream looks like the normal/natural thing to
do. So if we don't do that and chose the Debian patch, there should be
some kind of justification for it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
