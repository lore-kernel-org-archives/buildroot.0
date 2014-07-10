From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 10 Jul 2014 12:01:52 -0700
Subject: [Buildroot] i.MX 3.10.17 updates
In-Reply-To: <726E1478A66AD646A8419562133B4C3D0EB71DFB@mxadeneo.adeneo-embedded.us>
References: <53BEDF43.9020401@boundarydevices.com>
 <726E1478A66AD646A8419562133B4C3D0EB71DFB@mxadeneo.adeneo-embedded.us>
Message-ID: <CADCpmyOhiNWv31pdUi5=Q3n-vD9jiFO_8d3v61ZqAa6yaxLy9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resend my e-mail with the correct e-mail address so the mailing-list can
see it:

On Thu, Jul 10, 2014 at 11:53 AM, BISSON Gary <gbisson@adeneo-embedded.us>
wrote:

> Hi Eric,
>
> Please find attached both my buildroot and my kernel config.
> I was using a code sourcery 2013.05 toolchain for my testing.
> Regarding GStreamer, might just be a missing plugin not necessarily
> related to the fsl one. Hope my config will help.
>
> Regards,
> Gary
> ________________________________________
> From: Eric Nelson [eric.nelson at boundarydevices.com]
> Sent: Thursday, July 10, 2014 11:45 AM
> To: Yann E. MORIN; BISSON Gary; Hadrien Boutteville;
> buildroot at buildroot.org
> Subject: i.MX 3.10.17 updates
>
> Hi all,
>
> Thanks for all of your work on this.
>
> I've been able to validate the GPU portions of this, but
> I'm struggling a bit with the VPU and gstreamer.
>
> Using roughly Gary's configuration, I had trouble using
> playbin2 or gplay loading the Freescale software codecs:
>
> (gst-plugin-scanner:157): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-0.10/libmfw_gst_mpeg4aspdec.so':
> lib_MPEG4ASP_dec_arm11_elinux.so.1: cannot open shared object file: No
> such file or directory
>
> After messing around with the toolchain, I found that listing
> directories (usr/lib/imx-mm/audio-codec and video-codec) allowed
> the plugins to load.
>
> After that, I'm still having trouble getting playback to work:
>
>         # gplay tears_of_steel_1080p.webm
>         playbin2 is employed!
>         fsl_player_init(): Successfully initialize!
>         fsl_player_set_media_location(): filename=tears_of_steel_1080p.webm
>         [Stopped  ][Vol=01][00:00:00/00:00:00][fps:0]state change failed
> from 2
> to 4
>         get GST_MESSAGE_ELEMENT missing-plugin, type=(string)decoder,
> detail=(GstCaps)video/webm, name=(string)"WebM\ demuxer";
> try to play failed
>
> Can one of you post your config file, toolchain details, and
> type of video you're able to play?
>
> Please advise,
>
>
> Eric
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/206d3697/attachment.html>
