From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:21:59 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/opencv: module objdetect
 depends on imgproc
In-Reply-To: <CAHXCMM+gkMR16KjCW=-2o0vw_0tXDmB931ZbVk1t=WwEOPj7+A@mail.gmail.com>
References: <1460992275-383-1-git-send-email-bernd.kuhls@t-online.de>
 <1460992275-383-2-git-send-email-bernd.kuhls@t-online.de>
 <20160418212003.393f594c@free-electrons.com>
 <CAHXCMM+gkMR16KjCW=-2o0vw_0tXDmB931ZbVk1t=WwEOPj7+A@mail.gmail.com>
Message-ID: <20160418222159.166e2790@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 21:57:49 +0200, Samuel Martin wrote:

> > Can you comment on this one? I thought we had no expression of the
> > interdependencies between OpenCV modules. Are those interdependencies
> > build-time dependencies or run-time dependencies?
> In opencv(2) we don't, in opencv3 we do.
> 
> I did the work on opencv3 when bumping the package, but did not take
> the time to do it on opencv(2) after we reverted it.
> 
> These interdependencies are build-time deps., they are already
> expressed in the cmake code.
> One just needs to extract the info and report it in the Config.in.
> I'll check if I can quickly dig up something about this on the
> opencv(2) package.

If they are already expressed in the CMake code, the build will not
fail, so why did you object to the previous iteration of Bernd's patch?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
