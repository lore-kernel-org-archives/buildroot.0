From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 9 Aug 2016 14:25:40 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <20160809141535.4c9b8169@free-electrons.com>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
Message-ID: <CAAMH-ytVJUjhBkGTFoEMwVsOiRrEnXdSjtR45Xm6-qWkGH4OBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tue, Aug 9, 2016 at 2:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> <snip>
>>          arm |                gst1-imx-0.12.2 | NOK | http://autobuild.buildroot.net/results/b460a770c8f4e992d29dde8fe37fc23a949937f2/
>
> error: 'V4L2_PIX_FMT_XRGB555X' undeclared (first use in this function)
>
> and other errors. We use kernel headers 4.7 since recently. Maybe
> there's something to fix here?

Actually I see in the defconfig that the external headers are 3.10
which is the issue. This V4L2 format was added in 3.18.
http://lxr.free-electrons.com/ident?v=3.10;i=V4L2_PIX_FMT_XRGB555X
http://lxr.free-electrons.com/ident?v=3.18;i=V4L2_PIX_FMT_XRGB555X

I've submitted a patch to Carlos to fix that:
https://github.com/Freescale/gstreamer-imx/pull/106

I don't see any other error, there's an 'error' variable that isn't
used but that's a warning.

I would wait for the change to be merged but if you want we can add
that patch to the Buildroot package for now.

Regards,
Gary
