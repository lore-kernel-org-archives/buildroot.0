From: Rostislav Lisovy <lisovy@jablotron.cz>
Date: Mon, 30 Mar 2015 17:33:21 +0200
Subject: [Buildroot] [PATCH v4] gst1-imx: add package
In-Reply-To: <1427710343-23255-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1427710343-23255-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1427729601.28675.3.camel@jablotron.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2015-03-30 at 12:12 +0200, Gary Bisson wrote:
> Open-source GStreamer 1.0 plugins for i.MX6 platforms.
> More info at https://github.com/Freescale/gstreamer-imx
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Tested-by: Rostislav Lisovy <lisovy@jablotron.cz>

My test scenario:
gst-launch-1.0 -e v4l2src device=/dev/video0 ! \
video/x-raw,width=640,height=480,framerate=15/1 ! \
imxipuvideotransform ! \
imxvpuenc_h264 idr-interval=16 bitrate=512 ! \
rtph264pay config-interval=5 pt=96 ! \
udpsink host=10.203.100.24 port=11111 sync=false

CPU usage -- cca 15 % on single core (imx6).

Best regards;
Rostislav Lisovy
