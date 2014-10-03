From: Mark <miscuentasvarias@gmail.com>
Date: Fri, 3 Oct 2014 15:49:27 +0200
Subject: [Buildroot] [buildroot][gstreamer] Problems with gst-fsl-plugins
	for iMX6
Message-ID: <01f401cfdf10$da45c4f0$8ed14ed0$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi! After building buildroot with gstreamer 0.10 and gst-fsl-plugins, I
can't no use aiurdemux nor beep plugins. If I run "gst-inspect aiurdemux"  I
get:

 

# gst-inspect aiurdemux

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **: gst_pad_template_new:
assertio

n 'caps != NULL' failed

 

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **: gst_pad_template_new:
assertio

n 'caps != NULL' failed

 

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **: gst_pad_template_new:
assertio

n 'caps != NULL' failed

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **: gst_pad_template_new:
assertio

n 'caps != NULL' failed

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **: gst_pad_template_new:
assertio

n 'caps != NULL' failed

 

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

 

(gst-plugin-scanner:1514): GStreamer-CRITICAL **:
gst_element_class_add_pad_temp

late: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

 

(gst-plugin-scanner:1514): GStreamer-WARNING **: Failed to load plugin
'/usr/lib

/gstreamer-0.10/libmfw_gst_audio_pp.so': lib_peq_arm11_elinux.so.1: cannot
open

shared object file: No such file or directory

 

(gst-plugin-scanner:1514): GStreamer-WARNING **: Failed to load plugin
'/usr/lib

/gstreamer-0.10/libmfw_gst_amrdec.so': lib_nb_amr_dec_arm9_elinux.so.2:
cannot o

pen shared object file: No such file or directory

 

(gst-plugin-scanner:1514): GStreamer-WARNING **: Failed to load plugin
'/usr/lib

/gstreamer-0.10/libmfw_gst_mpeg4aspdec.so':
lib_MPEG4ASP_dec_arm11_elinux.so.1:

cannot open shared object file: No such file or directory

 

 

(gst-plugin-scanner:1514): GStreamer-WARNING **: Failed to load plugin
'/usr/lib

/gstreamer-0.10/libmfw_gst_h264dec.so': lib_H264_dec_arm11_elinux.so.2:
cannot o

pen shared object file: No such file or directory

 

(gst-plugin-scanner:1514): GStreamer-WARNING **: Failed to load plugin
'/usr/lib

/gstreamer-0.10/libmfw_gst_mp3enc.so': lib_mp3_enc_arm12_elinux.so.2: cannot
ope

n shared object file: No such file or directory

 

(gst-plugin-scanner:1514): GStreamer-WARNING **: Failed to load plugin
'/usr/lib

/gstreamer-0.10/libmfw_gst_mpeg2dec.so': lib_mpeg2_dec_arm11_elinux.so.2:
cannot

open shared object file: No such file or directory

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **:
gst_element_class_add_pad_templa

te: assertion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **: gst_pad_new_from_template:
asser

tion 'GST_IS_PAD_TEMPLATE (templ)' failed

 

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **:
gst_pad_set_activate_function: a

ssertion 'GST_IS_PAD (pad)' failed

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **:
gst_pad_set_activatepull_functio

n: assertion 'GST_IS_PAD (pad)' failed

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **:
gst_pad_set_activatepush_functio

n: assertion 'GST_IS_PAD (pad)' failed

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **: gst_pad_set_chain_function:
asse

rtion 'GST_IS_PAD (pad)' failed

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **: gst_pad_set_event_function:
asse

rtion 'GST_IS_PAD (pad)' failed

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **: gst_element_add_pad:
assertion '

GST_IS_PAD (pad)' failed

 

 

(gst-inspect-0.10:1513): GStreamer-CRITICAL **:
gst_pad_set_setcaps_function: as

sertion 'GST_IS_PAD (pad)' failed

 

 

- cannot open shared object problem:

 

In /usr/lib/imx-mm/audio-codec, /usr/lib/imx-mm/video-codec and
/usr/lib/imx-mm/parser, I have those missing libraries but only the .so
versions, not .so.1 or so.2.

 

I can solve this by copying the .so versions to so.1 and so.2 but I think
this is not the best solution.

 

- GStreamer-CRITICAL problem:

 

How can solve this critical problem? gst-plugins-good works fin, but
gst-fsl-plugins doesn't and I need them to play videos using the vpu.

 

I have a yocto and timesys distribution that work fine, but just copying the
plugins doesn't work. Any advice?

 

I've tried many buildroot versions, using eglibc, glibc, . without success.

 

Thanks in advance!

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141003/56f64cd0/attachment.html>
