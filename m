From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Dec 2016 15:44:28 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
In-Reply-To: <CALnvph3Kr5Rtc8W5FD_oJSRm58sU_gmkNGQfy+M11kCz8BG3TA@mail.gmail.com>
References: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
 <20161215214757.0eb1f3d8@free-electrons.com>
 <CALnvph3Kr5Rtc8W5FD_oJSRm58sU_gmkNGQfy+M11kCz8BG3TA@mail.gmail.com>
Message-ID: <20161216154428.200e5378@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


> > Are you sure you need those set of plugins to be built to build the
> > gst1-vaapi plugin? I'm not too familiar with GStreamer, so maybe this
> > is correct, but it looks strange.  
> 
> I added them based on the requirements section found here:
> https://github.com/01org/gstreamer-vaapi

OK. The configure.ac script indeed checks for plugins-base, but not for
plugins-bad.

Could you have a look at the configure.ac script? It seems like it
supports multiple renderers, not only DRM. If you don't want to support
all of them because you don't use them, that's fine. But you should
then use the appropriate --enable/--disable options to enable the right
renderer, and disable the other ones.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
