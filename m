From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 15 Aug 2014 08:31:58 -0700
Subject: [Buildroot] Understanding a sysroot issue with 2014.08-rc1
Message-ID: <CALo-6+hcfoU04dwydZvdLr7sh6bMQEUzNsAjJqUv7e5_jr=Ezg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen:

I am trying to work with the latest buildroot-2014.08-rc1 with a currently
used external toolchain. I am currently using buildroot-2013.08 which is
working fine with the Linaro 2013.04 external toolchain. My project is an
ARM AM3517 based project using Qt5.

In trying to use this same external toolchain with buildroot-2014.08, I get
caught up in

Incorrect selection of kernel headers: expected 2.6.x, got 3.2.x

I can see what is happening is that buildroot is looking at the version of
the headers on the development Linux PC, which are 3.2 and
check-kernel-headers.sh is looking in /usr/include/linux/version.h.

I do have a kernel tree for the 2.6.37 kernel we are working in and it is
in ~/.../linux-2.6.37, so its partial path to version.h is
linux-2.6.37/include/linux/version.h.

Since there is no .../usr/... in this path, I have a little trouble
visualizing how to set SYSROOT as an environment variable to allow the
toolchain to pick up the custom 2.6 headers instead of the development PC's
system headers.

Could someone help me understand the path through the "Valley of
Uncertainty" around the "Swamp of Ambiguity" past the "Rocks of Confusion"
to the top of the "Ridge of Enlightment", please.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140815/08d8f6ea/attachment.html>
