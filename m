From: Frederik Pasch <fpasch@googlemail.com>
Date: Tue, 14 Sep 2010 10:57:54 +0200
Subject: [Buildroot] [git commit master 1/1] gst-plugins-good: udp
 plugin needs ipv6 support
In-Reply-To: <20100722143544.BEF0382B81@busybox.osuosl.org>
References: <20100722143544.BEF0382B81@busybox.osuosl.org>
Message-ID: <AANLkTi=8jNQgz9pzBUJZWminQfXe7BM0_-AfikoKcexG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/7/22 Peter Korsgaard <jacmet@sunsite.dk>:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=6d249fcdface15ae236b7eb71dc84d8e3c28f417
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
> index a326dc9..3b37b5e 100644
> --- a/package/multimedia/gst-plugins-good/Config.in
> +++ b/package/multimedia/gst-plugins-good/Config.in
> @@ -134,8 +134,12 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
> ? ? ? ?bool "spectrum"
>
> ?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
> + ? ? ? depends on BR2_INET_IPV6
> ? ? ? ?bool "udp"
>
> +comment "udp requires a toolchain with IPv6 support"
> + ? ? ? depends on !BR2_INET_IPV6
> +
> ?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
> ? ? ? ?bool "videobox"


Is there a reason why the udp-plugin shouldn't work with ipv4-only toolchains?

On my IPv4-only system the udpsrc-element of gst-plugins-good works as
expected...

Frederik Pasch
