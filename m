From: Juan A. Rubio <jarubio2001@gmail.com>
Date: Wed, 23 Jan 2019 19:24:54 +0000
Subject: [Buildroot] imx6 solo VPU support in Buildroot
In-Reply-To: <CAAMH-yvsh54w1AbqDrHa5Tmc5RJaiyf6zYzPhd205=kf7+NMhw@mail.gmail.com>
References: <CAE58QoON4RUMgNdtUjBQDpYrmUSqTzjTyxJ+3LGPa=V=Q8kTRw@mail.gmail.com>
 <CAOMZO5Aso5o=qeRWYcXoQfQb714APBi7ZgR3aszXgvxEmx8UJA@mail.gmail.com>
 <CAE58QoOdeCvOVNBVx=oWzYLgiO-R8A-S2zC1ZtR4-3wGbUVCJw@mail.gmail.com>
 <CAAMH-ytuk2w9Tj19TzrXyU4R1qCqS-=CfLRyGnicJw_dOYK=fQ@mail.gmail.com>
 <CAE58QoM4dqY37hHdoRctcXRg3bnK1RsVHg2g58AixyN-p2qT=g@mail.gmail.com>
 <CAE58QoP-N7wbKjAiZtLgdcVXrmJO6BhwQ0yNFihXyuLLk8MEpg@mail.gmail.com>
 <CAAMH-yvsh54w1AbqDrHa5Tmc5RJaiyf6zYzPhd205=kf7+NMhw@mail.gmail.com>
Message-ID: <CAE58QoN+iT+p7k=_BmT9YGbdDT6BpO8Nv+m4jorXq-ui6c4mvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I looks like 'playbin' tries to use 'avdec_h264'...



# gst-launch-1.0 -v playbin uri=file:///opt/video.mp4
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: ring-buffer-max-size = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: buffer-size = -1
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: buffer-duration = -1
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: use-buffering = false
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: download = false
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: uri = file:///opt/video.mp4
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: connection-speed = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: source =
"\(GstFileSrc\)\ source"
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstTypeFindElement:typefind.GstPad:src:
caps = video/quicktime, variant=(string)iso
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstTypeFindElement:typefind.GstPad:src:
caps = NULL
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0.GstPad:src_0:
caps = video/x-h264, stream-format=(string)avc, alignment=(string)au,
level=(string)3, profile=(string)high,
codec_data=(buffer)0164001effe100196764001eacd940a03db011000003000100000300320f162d9601000668ebe3cb22c0,
width=(int)640, height=(int)480, framerate=(fraction)25/1,
pixel-aspect-ratio=(fraction)1/1
max8903-charger max8903 at 0: USB Charger Connected.
ci_hdrc ci_hdrc.0: EHCI Host Controller
ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 2
ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
max8903-charger max8903 at 0: USB Charger Disconnected.
ci_hdrc ci_hdrc.0: remove, state 1
usb usb2: USB disconnect, device number 1
ci_hdrc ci_hdrc.0: USB bus 2 deregistered
Redistribute latency...
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/avdec_h264:avdec_h264-0.GstPad:sink:
caps = video/x-h264, stream-format=(string)avc, alignment=(string)au,
level=(string)3, profile=(string)high,
codec_data=(buffer)0164001effe100196764001eacd940a03db011000003000100000300320f162d9601000668ebe3cb22c0,
width=(int)640, height=(int)480, framerate=(fraction)25/1,
pixel-aspect-ratio=(fraction)1/1
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-buffers = 5
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-time = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-bytes = 2097152
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0.GstMultiQueuePad:sink_0:
caps = video/x-h264, stream-format=(string)avc, alignment=(string)au,
level=(string)3, profile=(string)high,
codec_data=(buffer)0164001effe100196764001eacd940a03db011000003000100000300320f162d9601000668ebe3cb22c0,
width=(int)640, height=(int)480, framerate=(fraction)25/1,
pixel-aspect-ratio=(fraction)1/1
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-buffers = 5
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-time = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-bytes = 2097152
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-buffers = 5
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-time = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-bytes = 2097152
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-buffers = 5
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-time = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-bytes = 2097152
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-buffers = 5
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-time = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-bytes = 2097152
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-buffers = 5
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-time = 0
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstMultiQueue:multiqueue0:
max-size-bytes = 2097152
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/avdec_h264:avdec_h264-0.GstPad:src:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstInputSelector:inputselector0.GstSelectorPad:sink_0:
always-ok = false
/GstPlayBin:playbin0/GstInputSelector:inputselector0.GstSelectorPad:sink_0:
active = true
/GstPlayBin:playbin0/GstInputSelector:inputselector0: active-pad =
"\(GstSelectorPad\)\ sink_0"
Missing element: GStreamer element videoconvert
WARNING: from element /GstPlayBin:playbin0/GstPlaySink:playsink:
Missing element 'videoconvert' - check your GStreamer installation.
Additional debug info:
gstplaysink.c(1507): gen_video_deinterlace_chain ():
/GstPlayBin:playbin0/GstPlaySink:playsink:
video rendering might fail
Missing element: GStreamer element deinterlace
WARNING: from element /GstPlayBin:playbin0/GstPlaySink:playsink:
Missing element 'deinterlace' - check your GStreamer installation.
Additional debug info:
gstplaysink.c(1520): gen_video_deinterlace_chain ():
/GstPlayBin:playbin0/GstPlaySink:playsink:
deinterlacing won't work

(gst-launch-1.0:461): GStreamer-CRITICAL **: gst_pad_unlink: assertion
'GST_PAD_IS_SRC (srcpad)' failed

(gst-launch-1.0:461): GStreamer-CRITICAL **: gst_pad_link_full:
assertion 'GST_PAD_IS_SRC (srcpad)' failed
/GstPlayBin:playbin0/GstInputSelector:inputselector0.GstPad:src: caps
= video/x-raw, format=(string)I420, width=(int)640, height=(int)480,
interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1,
chroma-site=(string)mpeg2, colorimetry=(string)bt601,
framerate=(fraction)25/1
/GstPlayBin:playbin0/GstPlaySink:playsink.GstGhostPad:video_sink.GstProxyPad:proxypad4:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstPlaySink:playsink/GstStreamSynchronizer:streamsynchronizer0.GstPad:src_0:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstPlaySink:playsink/GstBin:vdbin.GstGhostPad:sink.GstProxyPad:proxypad8:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstPlaySink:playsink/GstBin:vdbin.GstGhostPad:sink:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstPlaySink:playsink/GstStreamSynchronizer:streamsynchronizer0.GstPad:sink_0:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstPlaySink:playsink.GstGhostPad:video_sink: caps
= video/x-raw, format=(string)I420, width=(int)640, height=(int)480,
interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1,
chroma-smax8903-charger max8903 at 0: USB Charger Connected.
ite=(string)mpeg2, colorimetry=(smax8903-charger max8903 at 0: USB
Charger Disconnected.
tring)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstInputSelector:inputselector0.GstSelectorPad:sink_0:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0.GstGhostPad:src_0.GstProxyPad:proxypad3:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0.GstDecodePad:src_0.GstProxyPad:proxypad2:
caps = video/x-raw, format=(string)I420, width=(int)640,
height=(int)480, interlace-mode=(string)progressive,
pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)mpeg2,
colorimetry=(string)bt601, framerate=(fraction)25/1
Redistribute latency...
/GstPlayBin:playbin0/GstInputSelector:inputselector0.GstSelectorPad:sink_0:
tags = taglist, video-codec=(string)"H.264\ /\ AVC",
bitrate=(uint)385285;
/GstPlayBin:playbin0/GstInputSelector:inputselector0.GstSelectorPad:sink_0:
tags = taglist, video-codec=(string)"H.264\ /\ AVC",
bitrate=(uint)385285, encoder=(string)Lavf56.40.101,
container-format=(string)"ISO\ MP4/M4A";
ERROR: from element
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstQTDemux:qtdemux0:
Internal data stream error.
Additional debug info:
qtdemux.c(6033): gst_qtdemux_loop ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstQTDemux:qtdemux0:
streaming stopped, reason not-linked (-1)
ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
Freeing pipeline ...


Note that 'imxvpudec' is found by gst-inspect

# gst-inspect-1.0 imxvpudec
Factory Details:
  Rank                     primary + 1 (257)
  Long-name                Freescale VPU video decoder
  Klass                    Codec/Decoder/Video
  Description              hardware-accelerated video decoding using
the Freescale VPU engine
  Author                   Carlos Rafael Giani <dv@pseudoterminal.org>

Plugin Details:
  Name                     imxvpu
  Description              video en- and decoder elements using the
Freescale i.MX VPU
  Filename                 /usr/lib/gstreamer-1.0/libgstimxvpu.so
  Version                  0.13.0
  License                  LGPL
  Source module            gstreamer-imx
  Binary package           Unknown package release
  Origin URL               Unknown package origin

GObject
 +----GInitiallyUnowned
       +----GstObject
             +----GstElement
                   +----GstVideoDecoder
                         +----GstImxVpuDecoder

Pad Templates:
  SINK template: 'sink'
    Availability: Always
    Capabilities:
      video/x-h264
                 parsed: true
          stream-format: byte-stream
              alignment: au
      video/mpeg
                 parsed: true
           systemstream: false
            mpegversion: [ 1, 2 ]
      video/mpeg
                 parsed: true
            mpegversion: 4
      video/x-divx
            divxversion: [ 5, 6 ]
      video/x-xvid
      video/x-h263
                variant: itu
      image/jpeg
      video/x-wmv
             wmvversion: 3
                 format: { (string)WVC1, (string)WMV3 }
      video/x-vp8

  SRC template: 'src'
    Availability: Always
    Capabilities:
      video/x-raw
                 format: { (string)I420, (string)Y42B, (string)Y444,
(string)NV12, (string)NV16, (string)NV24, (string)GRAY8 }
                  width: [ 16, 2147483647 ]
                 height: [ 16, 2147483647 ]
              framerate: [ 0/1, 2147483647/1 ]
         interlace-mode: { (string)progressive, (string)interleaved }


Element Flags:
  no flags set

Element Implementation:
  Has change_state() function: gst_imx_vpu_decoder_change_state

Element has no clocking capabilities.
Element has no URI handling capabilities.

Pads:
  SINK: 'sink'
    Pad Template: 'sink'
  SRC: 'src'
    Pad Template: 'src'

Element Properties:
  name                : The name of the object
                        flags: readable, writable
                        String. Default: "imxvpudecoder0"
  parent              : The parent of the object
                        flags: readable, writable
                        Object of type "GstObject"
  num-additional-framebuffers: Number of output framebuffers to
allocate for decoding in addition to the minimum number indicated by
the VPU and the necessary number of free buffers
                        flags: readable, writable
                        Unsigned Integer. Range: 0 - 32767 Default: 0

On Wed, Jan 23, 2019 at 5:25 PM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> Hi,
>
> Please try with playbin at first:
> $ gst-launch-1.0 -v playbin uri=file:///video.mp4
>
> Do you see it using vpudec?
>
> Regards,
>
> Gary Bisson
> Boundary Devices, LLC
> www.boundarydevices.com
>
> Gary Bisson
> Boundary Devices, LLC
> www.boundarydevices.com
>
>
> On Wed, Jan 23, 2019 at 5:15 PM Juan A. Rubio <jarubio2001@gmail.com> wrote:
> >
> > Hi,
> >
> > I'm still chasing the issue of hw-accelerated video playback on my
> > imx6 solo custom board.
> >
> > I'm now using the IMX6Q platform in my Buildroot config but I have not
> > switched to a mainline kernel, and I'm still using the nxp kernel
> > (imx6dl-sabresd.dts device tree with a few modifications, none of them
> > related to the VPU or GPU).
> >
> > In the BSP I can see that the VPU firmware files are in the expected location:
> > # ls /lib/firmware/vpu/
> > vpu_fw_imx27_TO1.bin  vpu_fw_imx51.bin      vpu_fw_imx6d.bin
> > vpu_fw_imx27_TO2.bin  vpu_fw_imx53.bin      vpu_fw_imx6q.bin
> >
> > I've verified that video decoding works using a software decoder with
> > this pipeline:
> > '$ gst-launch-1.0 filesrc location=video.mp4 ! qtdemux ! avdec_h264 !
> > imxeglvivsink'
> >
> > However, when I use the hw decoder, I get errors:
> > '$ gst-launch-1.0 filesrc location=video.mp4 ! qtdemux ! imxvpudec !
> > imxeglvivsink'
> >
> >  'failed delayed linking some pad of GstQTDemux named qtdemux0 to some
> > pad of GstImxVpuDecoder named imxvpudecoder0'
> >
> > Someone on #gstreamer told me that the 'h264parse' should have been
> > added before 'imxvpudec', but 'h264parse' is not present in the
> > gstreamer1 Buildroot package (I can see it is there in the gstreamer
> > 0.x package).
> >
> > Any ideas on what is the actual problem here?
> >
> > Thanks in advance.
> > Juan
> >
> >
> >
> >
> >
> >
> > On Fri, Jan 11, 2019 at 5:42 PM Juan A. Rubio <jarubio2001@gmail.com> wrote:
> > >
> > > Gary,
> > >
> > > Yes, I've seen this overlapping naming convention in other places.
> > > Makes sense. I'll try changing the platform to IMX6Q.
> > >
> > > Thanks for the clarification.
> > >
> > > BR,
> > > Juan
> > >
> > > On Fri, Jan 11, 2019 at 5:27 PM Gary Bisson
> > > <gary.bisson@boundarydevices.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Otherwise, the reason it has been removed is that IMX6S in NXP's
> > > > packages doesn't refer to the i.MX6 Solo processors but to the i.MX6
> > > > SoloLite and i.MX6 Solo X which do not have a VPU.
> > > >
> > > > You can see it in the menuconfig or package/freescale-imx/Config.in:
> > > > config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> > > >     bool "imx6q/imx6dl"
> > > >
> > > > config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
> > > >     bool "imx6sl/imx6sx"
> > > >
> > > > So for a i.MX6 Solo processor, you should use the IMX6Q platform as it
> > > > is meant for i.MX6 DualLite which is equivalent to the Solo.
> > > >
> > > > I know it all sounds confusing but that's how NXP/Freescale chose to
> > > > differentiate their CPU and we decided to match their naming
> > > > convention.
> > > >
> > > > Regards,
> > > > Gary
> > > >
> > > > Gary Bisson
> > > > Boundary Devices, LLC
> > > > www.boundarydevices.com
> > > >
> > > >
> > > > On Fri, Jan 11, 2019 at 1:59 PM Juan A. Rubio <jarubio2001@gmail.com> wrote:
> > > > >
> > > > > Thanks!,
> > > > >
> > > > > I'll try this other route.
> > > > >
> > > > >
> > > > > On Fri, 11 Jan 2019 at 12:17 Fabio Estevam <festevam@gmail.com> wrote:
> > > > >>
> > > > >> Hi Juan,
> > > > >>
> > > > >> On Fri, Jan 11, 2019 at 9:39 AM Juan A. Rubio <jarubio2001@gmail.com> wrote:
> > > > >> >
> > > > >> > Hi,
> > > > >> >
> > > > >> > I've noticed that the imx6 solo VPU is not supported in Buildroot
> > > > >> > starting from 2018.02.x
> > > > >> >
> > > > >> > There is some information about this in this commit:
> > > > >> > https://github.com/buildroot/buildroot/commit/b86b227fda97ef439a3cc0da03da0ebcad5c203a
> > > > >>
> > > > >> This is related to the VPU library used by the NXP vendor code.
> > > > >>
> > > > >> >
> > > > >> > Has anyone come up with a solution to successfully enable the VPU
> > > > >> > libraries on imx6 solo with Buildroot?. Is there any more information
> > > > >> > about this that might help to get this to work somehow?
> > > > >>
> > > > >> I am able to use VPU on mx6 with Buildroot using mainline kernel.
> > > > >>
> > > > >> You can use configs/imx6-sabresd_qt5_defconfig as a reference.
> > > > >>
> > > > >> Please check this post with the details:
> > > > >> https://imxdev.gitlab.io/tutorial/Decoding_video_with_a_mainline_kernel_on_i.MX6/
> > > > >
> > > > > _______________________________________________
> > > > > buildroot mailing list
> > > > > buildroot at busybox.net
> > > > > http://lists.busybox.net/mailman/listinfo/buildroot
