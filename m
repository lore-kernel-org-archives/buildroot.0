From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 May 2013 14:58:46 -0500
Subject: [Buildroot] [PATCH v7 00/10] add Gstreamer 1.X for gst-omx
	support
In-Reply-To: <20130527202508.662f74ab@skate>
References: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
 <20130527202508.662f74ab@skate>
Message-ID: <CAEBucnAfh3MsG9itFTxmb53cnTyFT7XAhewGQS3zXCoLigN3qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On May 27, 2013 1:25 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Spenser Gilliland,
>
> On Sun, 26 May 2013 12:12:13 -0500, Spenser Gilliland wrote:
> > This patch adds gst-omx support to buildroot. Thus, making it possible
to use
> > gstreamer applications which utilize hardware acceleration on OpenMAX
supported
> > systems.
> >
> > To add gst-omx, libglib2 is bumped to 2.36.1 and gstreamer1 is added.
>
> As explained on IRC, bumping libglib2 to 2.36.1 breaks the build of
> webkit. Besides that, I've built a number of packages that use
> libglib2, and I've built gstreamer1 itself, and it was fine here.
>
> So, the webkit problem needs to be fixed, either by adding a patch to
> the current version of webkit, or by bumping webkit. In the end,
> bumping webkit is certainly the nicest solution, but it may turn this
> patch series into a much larger one.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Thomas,

Im working on the bump to webkit 1.9.6.  So far, this requires a libsoup
and libgtk2 bump as well.

Due to the tight dependencies between libglib2/webkit, the patch will not
be bisectable unless the webkit and libglib2 bump occur atomically. (the
libgtk2 and libsoup bumps may or may not be required to occur atomically.)
This makes this single patch quite large; therefore, im unsure if I should
make this a monolithic patch or a series of non bisectable patches (there
may also be a no-ff merge option.)

Im currently working on narrowing down a couple remaining issues but should
be able to send out the patches by end of tomm.

Thanks,
Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130527/a211bb86/attachment.html>
