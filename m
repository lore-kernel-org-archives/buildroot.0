From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 13 May 2011 09:03:35 -0400
Subject: [Buildroot] [PATCH] ffmpeg: ffmpeg binary requires swscale
In-Reply-To: <BANLkTi=SdF5rDW8N37=BYtk+7WF2T0fMXQ@mail.gmail.com>
References: <1305233238-324-1-git-send-email-mike@mikebwilliams.com>
	<87wrhukhb3.fsf@macbook.be.48ers.dk>
	<BANLkTik9W5Ewhj=0FB+WbPnrJ8F8YwxU9w@mail.gmail.com>
	<BANLkTi=SdF5rDW8N37=BYtk+7WF2T0fMXQ@mail.gmail.com>
Message-ID: <BANLkTikKbnWwqGyY_27gptf5tVPwAnNORA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forwarding to the list.

On Fri, May 13, 2011 at 6:48 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Mike" == Mike Williams <mike@mikebwilliams.com> writes:
>
> ?Mike> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ?Mike> ---
> ?Mike> ?package/multimedia/ffmpeg/Config.in | ? ?1 +
> ?Mike> ?1 files changed, 1 insertions(+), 0 deletions(-)
>
> ?Mike> diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
> ?Mike> index 7a9513c..d11233e 100644
> ?Mike> --- a/package/multimedia/ffmpeg/Config.in
> ?Mike> +++ b/package/multimedia/ffmpeg/Config.in
> ?Mike> @@ -27,6 +27,7 @@ config BR2_PACKAGE_FFMPEG_NONFREE
>
> ?Mike> ?config BR2_PACKAGE_FFMPEG_FFMPEG
> ?Mike> ? ? ? ? ?bool "Build ffmpeg (the command line application)"
> ?Mike> + ? ? ? ?select BR2_PACKAGE_FFMPEG_SWSCALE
>
> Really? It seems to build OK without it here.
>
> --
> Bye, Peter Korsgaard
>

It looks like the configure script for ffmpeg 0.6.1 lists swscale as a
dependency for ffmpeg. At least on my system, it isn't building the
ffmpeg binary unless I also select swscale. ffserver, ffplay, and
ffprobe all build fine without it.

1435: ffmpeg_deps="avcodec avformat swscale"

Thanks,
Mike
