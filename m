From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 4 Jul 2019 20:25:28 +0200
Subject: [Buildroot] How do I enable webrtc as part of external
 gstreamer, in buildroot
In-Reply-To: <CADNjvP-VYgO7ctGsOjZxudkA7k6PzT4FNt+JRACmUV6=bh_E=Q@mail.gmail.com>
References: <CADNjvP-VYgO7ctGsOjZxudkA7k6PzT4FNt+JRACmUV6=bh_E=Q@mail.gmail.com>
Message-ID: <20190704202528.63f7d667@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vered,

On Thu, 4 Jul 2019 15:38:59 +0300, Vered Kalef <vered.kalef@gmail.com> wrote:

> Hi all,
> I'm trying to install external gstreamer with webrtc enabled on buildroot.

What do your mean with 'external'? Why 'external'?

> It seems this option is missing within the buildroot.

Which option? There is definitely an GStreamer webrtc option (since
2019.05), see [1]...

Which Buildroot version do you use?

> I've configured the mk file and the Config.in file.
> After installation when I check gst-inspect webrtcbin, I get -
> 
> No such element or plugin ?webrtcbin'
> What am I missing?

Take a look at the gst1-plugins-bad configure output (or
build/gst1-plugins-bad-<version>/config.log for a hint
what is missing (look for webrtc entries)....

> gst1-plugins-bad/Config.in config
> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC bool "webrtc" depends on
> !BR2_STATIC_LIBS # libnice -> gnutls select BR2_PACKAGE_GST1_PLUGINS_BASE #
> libgstsdp select BR2_PACKAGE_LIBNICE help WebRTC plugins (webrtcbin - a bin
> for webrtc connections comment "webrtc needs a toolchain w/ dynamic
> library" depends on BR2_STATIC_LIBS gst1-plugins-bad/gst1-plugins-bad.mk
> ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
> GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc GST1_PLUGINS_BAD_DEPENDENCIES
> += libnice GST1_PLUGINS_BAD_DEPENDENCIES += gst1-plugins-base libnice else
> GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc endif
> 

Mind to share your config and/or defconfig file?

Regards,
Peter

[1] https://git.buildroot.net/buildroot/tree/package/gstreamer1/gst1-plugins-bad/Config.in#n566

> Regards,
> Vered
