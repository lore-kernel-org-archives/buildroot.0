From: Matthew Weber <matthew.weber@collins.com>
Date: Fri, 27 Sep 2019 12:48:06 -0500
Subject: [Buildroot] [External] Re: [autobuild.buildroot.net] Daily
 results for 2019-09-25
In-Reply-To: <CAFGfvX4U-Nn=h5Rcorzox-fbLb1WHPaY37sGr6oj21fJBnxV0Q@mail.gmail.com>
References: <20190926061635.076C087C89@hemlock.osuosl.org>
 <CANQCQpawzY=WiSPSFpmhiae9oN+HFj0ogTJsLKhQFX-mFLrAug@mail.gmail.com>
 <CAFGfvX4U-Nn=h5Rcorzox-fbLb1WHPaY37sGr6oj21fJBnxV0Q@mail.gmail.com>
Message-ID: <CANQCQpb2tDVK=8uD+Q5e1cYOLKnYJ5PXtTC+j2OCkqjG2XJTWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+buildroot

On Fri, Sep 27, 2019 at 12:47 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Matt,
>
> No, not in wpa_supplicant. I will take a look at this failure as well.
>
> Regards,
> Sergey
>
> ??, 27 ????. 2019 ?. ? 20:09, Matthew Weber <matthew.weber@collins.com>:
> >
> > All,
> >
> >
> > On Thu, Sep 26, 2019 at 1:16 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > Autobuild statistics for 2019-09-25
> > > ===============================
> > >
> >
> > [snip]
> >
> > >     arm      |          hostapd-2.9           | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_36e6e2662f89024defa83749d102d093b1f0a637&d=DwIFaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=oNADsUHQ2ttEws6lDhczzWofd_0m1aGuMQudTkESVKI&s=35ki-6gnbSISXYzWM05sI4bNErA4UrsD3pycSXAtey4&e=  |
> > >     arm      |          hostapd-2.9           | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_f39a45e1e6ddcd5b3438f52e14ee78872775823b&d=DwIFaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=oNADsUHQ2ttEws6lDhczzWofd_0m1aGuMQudTkESVKI&s=w6ZZIpR6DFka5NE1TKv3r_OV0WESy9ukNrrkY6HWpeQ&e=  |
> > >   sparc64    |          hostapd-2.9           | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_f5dff2e7321568f0555ee3b975ff83bb9536fedf&d=DwIFaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=oNADsUHQ2ttEws6lDhczzWofd_0m1aGuMQudTkESVKI&s=UK7j0oxTD8VVfwN8bVQCaGgs2y2WCrLlSlVXb37VChU&e=  |
> >
> > It looks like there must have been another configuration item in the
> > recent bump that didn't quite get flushed all the way through the make
> > options.
> >
> > NEED_LINUX_IOCTL=y  needs to be set so that linux_br_* is defined.
> > Sergey, did you notice anything like this in your wpa_supplicant
> > fixups?
> >
> > Matt
