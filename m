From: Henrik Frilund <henrik.frilund@convergens.fi>
Date: Thu, 28 Feb 2013 17:31:19 +0200
Subject: [Buildroot] Buildroot, none working GStreamer
In-Reply-To: <mailman.101702.1362062313.32592.buildroot@busybox.net>
References: <mailman.101702.1362062313.32592.buildroot@busybox.net>
Message-ID: <512F7847.7090107@convergens.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
  I have question regarding the build of GStreamer in buildroot 2012-08 
and 2012-11-01.
I have a custom board that is based around a Texas am335x chip which is 
a ARM Cortex A8 chip.
The embedded application I have is built around GStreamer and I use 
buildroot to build the rootfs
and the app itself.
  The problem i have encountered is that if I use any newer compiler 
than Sourcery 2010q1 of the external tool chains I get a broken 
GStreamer build. This meaning that the built gstreamer fails with
SIGABRT as soon as I launch the application.
  The same behaviour can be seen if i just do gst-inspect on the console 
with a debug level >3.

The things that I've noticed that on the broken builds in the debug 
information the thread ID information
is missing so what could cause that to happen.

I've talked to some of the GStreamer developers and they thought is was 
a toolchain issue but I'm having
a hard time believing that all newer sourcery toolchains and Linaro ones 
have the same issue. I also tried to build a custom toolchain with 
crosstool-ng but it has the same issue.

Anyone encountered anything like this before?

BR

//H
