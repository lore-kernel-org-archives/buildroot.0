From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 03 Oct 2014 17:30:26 +0200
Subject: [Buildroot] [buildroot][gstreamer] Problems with
	gst-fsl-plugins for iMX6
In-Reply-To: <01f401cfdf10$da45c4f0$8ed14ed0$@gmail.com>
References: <01f401cfdf10$da45c4f0$8ed14ed0$@gmail.com>
Message-ID: <2950192.AmLh8dchj8@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Friday 03 October 2014 15:49:27 Mark wrote:
> Hi! After building buildroot with gstreamer 0.10 and gst-fsl-plugins, I
> can't no use aiurdemux nor beep plugins. If I run "gst-inspect aiurdemux"  I
> get:
> 
> 
> 
> # gst-inspect aiurdemux
[...]
> In /usr/lib/imx-mm/audio-codec, /usr/lib/imx-mm/video-codec and
> /usr/lib/imx-mm/parser, I have those missing libraries but only the .so
> versions, not .so.1 or so.2.
[...]
In to help gstreamer to find libraries, you may add this to /etc/ld.so.conf:
 /usr/lib/imx-mm/audio-codec
 /usr/lib/imx-mm/video-codec
 /usr/lib/imx-mm/parser

In add, gstreamer create a cache of installed plugins. You may reset it by 
removing ~/.gstreamer-0.10.



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
