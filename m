From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:54:00 +0100
Subject: [Buildroot] [PATCH v2 4/6] ffmpeg: bump to version 4.1.
 ffserver is not supported anymore.
In-Reply-To: <20190131121526.11816-5-lpdev@cordier.org>
References: <20190131121526.11816-1-lpdev@cordier.org>
 <20190131121526.11816-5-lpdev@cordier.org>
Message-ID: <20190202155400.6547fba9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should be just:

	package/ffmpeg: bump to version 4.1

The fact that ffserver is removed should be part of the commit log.

On Thu, 31 Jan 2019 13:15:24 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>

I'd like to hear from Bernd about this ffmpeg bump. If I remember well,
major ffmpeg bumps are typically breaking some APIs, causing build
issues with packages that use ffmpeg.

Have you verified that other Buildroot packages that use ffmpeg do not
break after this ffmpeg version bump ?

>  package/ffmpeg/0001-ffmpeg-pthreads.patch | 34 -----------------------

Would be good to mention in the sommit log why this patch is removed
(accepted upstream ? no longer relevant ?)


> -config BR2_PACKAGE_FFMPEG_FFSERVER
> -	bool "Build ffserver"
> -	depends on BR2_USE_MMU # fork()
> -	help
> -	  FFserver is a streaming server for both audio and video.

If ffserver is no longer supported, we want to move this option to
Config.in.legacy so that users who have configurations with this
enabled are aware.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
