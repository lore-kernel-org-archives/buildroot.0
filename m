From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Apr 2020 07:44:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/bitstream: update tarball URL
In-Reply-To: <20200416052508.11828-1-bernd.kuhls@t-online.de>
References: <20200416052508.11828-1-bernd.kuhls@t-online.de>
Message-ID: <20200416074413.2f833747@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 07:25:08 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Use direct URL of upstream server instead of using an URL which causes
> redirects to, sometimes unreliable, mirror sites.
> 
> Fixes:
> http://autobuild.buildroot.net/results/cf1/cf1f80519570fdecacfeb45ac4a3ee9725be4b0f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/bitstream/bitstream.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
> index 12124a63d3..617cb96520 100644
> --- a/package/bitstream/bitstream.mk
> +++ b/package/bitstream/bitstream.mk
> @@ -6,7 +6,7 @@
>  
>  BITSTREAM_VERSION = 1.5
>  BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
> -BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
> +BITSTREAM_SITE = http://download.videolan.org/pub/videolan/bitstream/$(BITSTREAM_VERSION)

But we're using get.videolan.org in a number of other packages,
especially VLC. Isn't that a temporary issue that doesn't require
changing the package ? I've reported the issue on the #videolan IRC
channel.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
