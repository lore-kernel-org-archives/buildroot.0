From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 26 Aug 2012 12:14:34 -0400
Subject: [Buildroot] [PATCH] luajit: bug fix - prevent target CFLAGS
 from being used in host tool compile.
In-Reply-To: <20120826112016.13c9caae@skate>
References: <1344993930-2730-1-git-send-email-danomimanchego123@gmail.com>
 <20120826112016.13c9caae@skate>
Message-ID: <CANxTyt6zvYyRgydajjWsn69OKQyi_E++9cV-8zmqhdB=7JpPMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> It fixes build issues like
>
http://autobuild.buildroot.net/results/022b73a989734d800225c91f419f18f4fc31c264/build-end.log.

This link doesn't work for me, but I'll take your word for it.

> could you share what is your Buildroot configuration that uses
> -mfpu=neon -mfloat-abi=softfp ?
0
Right now, we are on a rather old version of buildroot, but looking forward
to updating to the latest when 2012-08 is officially released.  So it's
probably best to wait until then.

There are a couple of reasons why we added these two flags to "Target
Optimizations".  For one, the options that are pre-baked into the external
toolchain wrapper don't capture enabling neon optimization.  But, more
importantly, I wasn't able to get ffmpeg to recognize that neon
optimizations were applicable until I (1) added the --cpu=cortex-a8 (for
which I submitted a patch, never got any comments,
http://patchwork.ozlabs.org/patch/154307/), and (2) passed in the softfp
option as part of the --extra-cflags specified during the package configure
step (for which I never actually submitted a patch).  Hopefully, ffmpeg is
unique in this regard ...

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120826/cd57950e/attachment.html>
