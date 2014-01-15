From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 15 Jan 2014 19:12:04 +0100
Subject: [Buildroot] [PATCH v3 1/2] ffmpeg: bump to version 1.2.4
References: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl>
 <CAHXCMM+SfJ0j1vUTyHv7c2VbL9F1BimMcZD7YcfqXbOPmasssA@mail.gmail.com>
Message-ID: <kkviqaxprn.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> wrote
in
news:CAHXCMM+SfJ0j1vUTyHv7c2VbL9F1BimMcZD7YcfqXbOPmasssA at mail.gmail.com: 

> Have you tried gst-ffmpeg?
> It seems this bump triggers some build failures:
> http://autobuild.buildroot.net/results/3cd/3cd2a39bba732a625117aa2941923c
> 200ec55f51/build-end.log 
> 
> Reverting back to version 0.8.15 fixes the build.

Hi,

config logfrom gst-ffmpeg says:

configure: Using system-installed FFMpeg code
configure: WARNING:
  ======================================================================
   WARNING: you have chosen to build gst-ffmpeg against a random
   external version of Libav instead of building it against the tested
   internal Libav snapshot that is included with gst-ffmpeg.

   This is a very bad idea.  So bad in fact that words cannot express
   just how bad it is.  Suffice to say that it is BAD.

   The GStreamer developers cannot and will not support a gst-ffmpeg
   built this way.  Any bug reports that indicate there is an external
   version of Libav involved will be closed immediately without further
   investigation.

   The reason such a setup can't be supported is that the Libav API
   and ABI is in constant flux, yet there aren't any official releases
   of the Libav library to develop against.  This makes it impossible
   to guarantee that gst-ffmpeg will work reliably, or even compile,
   with a randomly picked version Libav.  Even if gst-ffmpeg compiles
   and superficially appears to work fine against your chosen external
   Libav version, that might just not be the case on other systems, or
   even the same system at a later time, or when using decoders,
   encoders, demuxers or muxers that have not been tested.

   Please do not create or distribute binary packages of gst-Libav
   that link against an external ffmpeg. Thank you!
  ======================================================================
  
configure: creating ./config.status

Currently I am testing a patch for gst-ffmpeg which uses "the tested 
internal Libav snapshot that is included with gst-ffmpeg". This should fix 
the problem.

Regards, Bernd
