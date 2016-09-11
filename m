From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:49:21 +0200
Subject: [Buildroot] [PATCH 0/4] Fix a few unmet dependencies (branch
 yem/unmet-deps)
In-Reply-To: <cover.1473597259.git.yann.morin.1998@free.fr>
References: <cover.1473597259.git.yann.morin.1998@free.fr>
Message-ID: <20160911154921.32548505@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 14:38:52 +0200, Yann E. MORIN wrote:

> However, there is one such unmet direct dependency I was not able to
> understand (with this series already applied):
> 
>     $ make KCONFIG_SEED=0x9F309288 randconfig
>     warning: (BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER)
>     selects BR2_PACKAGE_GST_PLUGINS_BASE which has unmet direct dependencies
>     (BR2_PACKAGE_GSTREAMER)
>     warning: (BR2_PACKAGE_FREERDP_GSTREAMER && BR2_PACKAGE_QT_WEBKIT &&
>     BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER) selects
>     BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP which has unmet direct dependencies
>     (BR2_PACKAGE_GSTREAMER && BR2_PACKAGE_GST_PLUGINS_BASE)
> 
> As far as I can see, the dependencies of gstreamer and gst-plugins-base
> *are* properly propagated to the offending packages. I think I'm gonna
> loose my sanity on that one... :-/ If any one feels adventurous...

Do you have some sample .config that exhibits those problems? I had a
quick look, and it indeed seems weird. opencv is select both gstreamer
and gst-plugins-base, so I don't see why the dependency of
gst-plugins-base on gstreamer is a problem.

>       linux/ext: fix Xenomai unmet dependencies
>       package/docker-engine: fix unmet dependencies
>       package/weston: fix unmet dependencies
>       system: fix unmet dependencies

All applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
