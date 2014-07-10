From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 10 Jul 2014 11:45:23 -0700
Subject: [Buildroot] i.MX 3.10.17 updates
Message-ID: <53BEDF43.9020401@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Thanks for all of your work on this.

I've been able to validate the GPU portions of this, but
I'm struggling a bit with the VPU and gstreamer.

Using roughly Gary's configuration, I had trouble using
playbin2 or gplay loading the Freescale software codecs:

(gst-plugin-scanner:157): GStreamer-WARNING **: Failed to load plugin
'/usr/lib/gstreamer-0.10/libmfw_gst_mpeg4aspdec.so':
lib_MPEG4ASP_dec_arm11_elinux.so.1: cannot open shared object file: No
such file or directory

After messing around with the toolchain, I found that listing
directories (usr/lib/imx-mm/audio-codec and video-codec) allowed
the plugins to load.

After that, I'm still having trouble getting playback to work:

	# gplay tears_of_steel_1080p.webm
	playbin2 is employed!
	fsl_player_init(): Successfully initialize!
	fsl_player_set_media_location(): filename=tears_of_steel_1080p.webm
	[Stopped  ][Vol=01][00:00:00/00:00:00][fps:0]state change failed from 2
to 4
	get GST_MESSAGE_ELEMENT missing-plugin, type=(string)decoder,
detail=(GstCaps)video/webm, name=(string)"WebM\ demuxer";
try to play failed

Can one of you post your config file, toolchain details, and
type of video you're able to play?

Please advise,


Eric
