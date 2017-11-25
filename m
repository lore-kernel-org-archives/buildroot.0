From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 14:02:10 +0100
Subject: [Buildroot] [PATCH v4 1/1] gstreamer1-mm: new package
In-Reply-To: <20171102152015.30318-1-aduskett@gmail.com>
References: <20171102152015.30318-1-aduskett@gmail.com>
Message-ID: <20171125140210.447d626c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 11:20:15 -0400, Adam Duskett wrote:

> diff --git a/package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch b/package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch
> new file mode 100644
> index 0000000000..6f7acd7fb0
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-mm/0001-remove-gstreamer-check-dependency.patch
> @@ -0,0 +1,29 @@
> +From 34637fd7b5cb8cf817858f18d47dc156b52c04bc Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Thu, 2 Nov 2017 10:39:00 -0400
> +Subject: [PATCH] remove gstreamer-check dependency
> +
> +gstreamer-check is disabled by default in buildroot and isn't required to
> +build gstreamermm.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index 45d92d4..903e00e 100755
> +--- a/configure
> ++++ b/configure

We really try to avoid patching the configure script directly, please
patch configure.ac instead, and use <pkg>_AUTORECONF = YES.

> +@@ -16633,7 +16633,7 @@ fi
> + # The format below is used so that the requirements appear nicely in the .pc
> + # file.
> + 
> +-GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.10.0 gstreamer-base-1.0 >= 1.10.0 gstreamer-check-1.0 >= 1.10.0 gstreamer-controller-1.0 >= 1.10.0 gstreamer-net-1.0 >= 1.10.0 gstreamer-allocators-1.0 >= 1.10.0 gstreamer-app-1.0 >= 1.10.0 gstreamer-audio-1.0 >= 1.10.0 gstreamer-fft-1.0 >= 1.10.0 gstreamer-pbutils-1.0 >= 1.10.0 gstreamer-plugins-base-1.0 >= 1.10.0 gstreamer-riff-1.0 >= 1.10.0 gstreamer-rtp-1.0 >= 1.10.0 gstreamer-rtsp-1.0 >= 1.10.0 gstreamer-sdp-1.0 >= 1.10.0 gstreamer-tag-1.0 >= 1.10.0 gstreamer-video-1.0 >= 1.10.0'
> ++GSTREAMERMM_MODULES='giomm-2.4 >= 2.47.6 gstreamer-1.0 >= 1.10.0 gstreamer-base-1.0 >= 1.10.0 gstreamer-controller-1.0 >= 1.10.0 gstreamer-net-1.0 >= 1.10.0 gstreamer-allocators-1.0 >= 1.10.0 gstreamer-app-1.0 >= 1.10.0 gstreamer-audio-1.0 >= 1.10.0 gstreamer-fft-1.0 >= 1.10.0 gstreamer-pbutils-1.0 >= 1.10.0 gstreamer-plugins-base-1.0 >= 1.10.0 gstreamer-riff-1.0 >= 1.10.0 gstreamer-rtp-1.0 >= 1.10.0 gstreamer-rtsp-1.0 >= 1.10.0 gstreamer-sdp-1.0 >= 1.10.0 gstreamer-tag-1.0 >= 1.10.0 gstreamer-video-1.0 >= 1.10.0'

However, this change is not upstreamable at all. Why is
gstreamer-check-1.0 needed by gstreamer1-mm ?

We should make the dependency on gstreamer-check-1.0 optional, under
the appropriate condition, in the configure.ac script.

Could you look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
