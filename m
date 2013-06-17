From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Jun 2013 07:22:05 +0200
Subject: [Buildroot] gst-fsl-plugins @ buildroot
In-Reply-To: <51BE6522.2040309@gluem.org>
References: <51BE6522.2040309@gluem.org>
Message-ID: <51BE9CFD.10002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Adrian,

  Please send questions like this to the mailing list, not directly to 
the author.

On 06/17/13 03:23, Adri?n wrote:
> Hello Arnout,
>
> I am trying to utilized buidroot + an IMX6 board to run gstreamer on it.
>
> Although gst-fsl-plugins compiles fine and so on, looks like gstreamer
> is not able to load the plugins:
>
> /usr/libexec/gstreamer-0.10/gst-plugin-scanner: symbol 'shm_open': can't
> resolve symbol
>
> (gst-plugin-scanner:1170): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-0.10/libmfw_gst_v4lsink.so': unknown dl-error
>
> (gst-plugin-scanner:1170): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-0.10/libmfw_gst_h264dec.so': File not found
>
> (gst-plugin-scanner:1170): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-0.10/libmfw_gst_amrdec.so': File not found
>
> (gst-plugin-scanner:1170): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-0.10/libmfw_gst_mpeg4aspdec.so': File not found
>
> (gst-plugin-scanner:1170): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-0.10/libmfw_gst_aacdec.so': File not found
>
> [...]
>
> The files are there for sure. However, I suspect that it is required to
> compile these plugins against some particular toolchain version due to
> the blobs involved (i.e some ABI break?).
>
> Have you been trying this under any IMX6 based board? any useful insight?

  I can only tell you that it worked for me :-) We use the Sourcery 
2009.11 toolchain. But as far as I can remember there are no binaries in

  The "shm_open" failure is suspicious, because that is a pretty standard 
symbol that is present in librt.so. I don't think gstreamer itself would 
build without shm_open.

  Regards,
  Arnout

>
> Thanks,
>
> Adrian.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
