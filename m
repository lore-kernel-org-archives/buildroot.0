From: Vered Kalef <vered.kalef@gmail.com>
Date: Sun, 14 Jul 2019 13:10:54 +0300
Subject: [Buildroot] Installed external gstreamer,
 enabled WebRTC and installed external libnice plugins to buildroot, however,
 libnice is missing
Message-ID: <CADNjvP9-5R2z+aUN7xKARboNkiReWVpZ7tNFg+xj81DObTE6fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm working with buildroot 18.02.
I've installed External gstreamer version 14.0.
I've managed to update the plugins-bad, to hold webrtc option.
For the webrtc I had to update libnice version, so I've installed it as
external libnice 0.1.14.
Now -
gst-inspect-1.0 webrtc
shows that webrtc exists!

Should it work as well:
gst-inspect-1.0 libnice

Is the installation of libnice as external is problematic?
I've called the external plugin CUSTOM_LIBNICE and referred to it from
custom-gst1-plugins-bad.mk -

ifeq ($(BR2_PACKAGE_CUSTOM_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
CUSTOM_GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
CUSTOM_GST1_PLUGINS_BAD_DEPENDENCIES += custom-gst1-plugins-base
CUSTOM_LIBNICE
else
CUSTOM_GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
endif

*The errors I got - *
0:00:05.765174600 17318 0x7fff64004400 WARN               webrtcbin
gstwebrtcbin.c:2991:gst_webrtc_bin_request_new_pad:<webrtcbin0> error:
libnice elements are not available
0:00:05.765219000 17318 0x7fff64004400 LOG              GST_MESSAGE
gstmessage.c:301:gst_message_new_custom: source webrtcbin0: creating new
message 0x7fff640bf2c0 error
0:00:05.765249100 17318 0x7fff64004400 WARN               structure
gststructure.c:1832:priv_gst_structure_append_to_gstring: No value
transform to serialize field 'gerror' of type 'GError'
0:00:05.765239500 17318 0x7fff64004400 DEBUG                GST_BUS
gstbus.c:318:gst_bus_post:<bus0> [msg 0x7fff640bf2c0] posting on bus error
message: 0x7fff640bf2c0, time 99:99:99.999999999, seq-num 65, element
'webrtcbin0', GstMessageError, gerror=(GError)NULL,
debug=(string)"gstwebrtcbin.c\(2991\):\ gst_webrtc_bin_request_new_pad\
\(\):\ /GstPipeline:pipeline0/GstWebRTCBin:webrtcbin0:\012libnice\
elements\ are\ not\ available";
0:00:05.765261300 17318 0x7fff64004400 DEBUG                    bin
gstbin.c:3715:gst_bin_handle_message_func:<pipeline0> [msg 0x7fff640bf2c0]
handling child webrtcbin0 message of type error
0:00:05.765283100 17318 0x7fff64004400 WARN               structure
gststructure.c:1832:priv_gst_structure_append_to_gstring: No value
transform to serialize field 'gerror' of type 'GError'
0:00:05.765281100 17318 0x7fff64004400 DEBUG                GST_BUS
gstbus.c:318:gst_bus_post:<bus1> [msg 0x7fff640bf2c0] posting on bus error
message: 0x7fff640bf2c0, time 99:99:99.999999999, seq-num 65, element
'webrtcbin0', GstMessageError, gerror=(GError)NULL,
debug=(string)"gstwebrtcbin.c\(2991\):\ gst_webrtc_bin_request_new_pad\
\(\):\ /GstPipeline:pipeline0/GstWebRTCBin:webrtcbin0:\012libnice\
elements\ are\ not\ available";
0:00:05.765327400 17318 0x7fff64004400 INFO        GST_ERROR_SYSTEM
gstelement.c:2172:gst_element_message_full_with_details:<webrtcbin0> posted
error message: Your GStreamer installation is missing a plug-in.

Thanks in advance,
Vered
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190714/a857a5cd/attachment.html>
