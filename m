From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue, 01 Oct 2013 14:50:03 -0700
Subject: [Buildroot] [PATCH 1/2] freescale-imx: separate variable
 assignment from Makefile
In-Reply-To: <20131001232710.2e3aaae5@skate>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>	<1380650790-18097-2-git-send-email-eric.nelson@boundarydevices.com>	<20131001214420.34d3ef48@skate>	<524B3C4D.20906@boundarydevices.com>
 <20131001232710.2e3aaae5@skate>
Message-ID: <524B438B.9000408@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

You (and Arnout) are right, of course.

On 10/01/2013 02:27 PM, Thomas Petazzoni wrote:
> Dear Eric Nelson,
>
> On Tue, 01 Oct 2013 14:19:09 -0700, Eric Nelson wrote:
>
>> I can do that if I move packages/gstreamer/gst-fsl-plugins/ under
>> packages/freescale-imx, but not otherwise.
>
> Are you sure?
>
> See:
>
> $ cat foo.mk
> YOURPACKAGE_VERSION = $(FREESCALE_IMX_VERSION)
>
> FREESCALE_IMX_VERSION = 42
>
> all:
> 	@echo $(YOURPACKAGE_VERSION)
>
> $ make -f foo.mk
> 42
> $
>
> This shows that the value of FREESCALE_IMX_VERSION can be given *after*
> it is used.
>

As Arnout said, I didn't grok that this is Make, with no
sub-makes, so everything's global...

I'll re-submit the gstreamer patch without this bit.

Regards,


Eric
