From: Vered Kalef <vered.kalef@gmail.com>
Date: Thu, 4 Jul 2019 15:38:59 +0300
Subject: [Buildroot] How do I enable webrtc as part of external gstreamer,
 in buildroot
Message-ID: <CADNjvP-VYgO7ctGsOjZxudkA7k6PzT4FNt+JRACmUV6=bh_E=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm trying to install external gstreamer with webrtc enabled on buildroot.
It seems this option is missing within the buildroot.
I've configured the mk file and the Config.in file.
After installation when I check gst-inspect webrtcbin, I get -

No such element or plugin ?webrtcbin'
What am I missing?
gst1-plugins-bad/Config.in config
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC bool "webrtc" depends on
!BR2_STATIC_LIBS # libnice -> gnutls select BR2_PACKAGE_GST1_PLUGINS_BASE #
libgstsdp select BR2_PACKAGE_LIBNICE help WebRTC plugins (webrtcbin - a bin
for webrtc connections comment "webrtc needs a toolchain w/ dynamic
library" depends on BR2_STATIC_LIBS gst1-plugins-bad/gst1-plugins-bad.mk
ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc GST1_PLUGINS_BAD_DEPENDENCIES
+= libnice GST1_PLUGINS_BAD_DEPENDENCIES += gst1-plugins-base libnice else
GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc endif

Regards,
Vered
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190704/a14f78a5/attachment.html>
