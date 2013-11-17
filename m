From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Nov 2013 09:01:25 +0100
Subject: [Buildroot] [PATCH] wayland: disable on avr32
In-Reply-To: <1384595893-15468-1-git-send-email-spdawson@gmail.com>
References: <1384595893-15468-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAXf6LVJmTG0j1UqkeBbu0dY2j-1HFk+PZRuLkn7tNPd-Sic6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Nov 16, 2013 at 10:58 AM,  <spdawson@gmail.com> wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> The epoll_create1, timerfd_create and timerfd_settime syscalls are not available
> on avr32. Fixes build failures such as the following.
>
>   http://autobuild.buildroot.net/results/43b/43b3df5978782034279604abde8fe5d46c441344/
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
>  package/wayland/Config.in                     | 2 ++
>  package/weston/Config.in                      | 2 ++
>  3 files changed, 5 insertions(+)
>
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index d6f087d..d028245 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -358,6 +358,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
>
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
>         bool "wayland"
> +       depends on !BR2_avr32 # wayland
>         depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
>         select BR2_PACKAGE_WAYLAND
>         help

It seems that several gstreamer plugins lack the necessary comments,
e.g. for thread support.
Normally, the avr32 dependency would also have been added to such comments...

I'll add that to my todo list for comments cleanup, but someone else
is free to take it of course...

Best regards,
Thomas
