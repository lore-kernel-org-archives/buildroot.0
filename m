From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue, 01 Oct 2013 14:19:09 -0700
Subject: [Buildroot] [PATCH 1/2] freescale-imx: separate variable
 assignment from Makefile
In-Reply-To: <20131001214420.34d3ef48@skate>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>	<1380650790-18097-2-git-send-email-eric.nelson@boundarydevices.com>
 <20131001214420.34d3ef48@skate>
Message-ID: <524B3C4D.20906@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/01/2013 12:44 PM, Thomas Petazzoni wrote:
> Dear Eric Nelson,
>
> On Tue,  1 Oct 2013 11:06:29 -0700, Eric Nelson wrote:
>> This patch pulls the variable assignments for the site and
>> version from freescale-imx.mk and places them into freescale-imx.inc
>> so they can be used by components in other trees
>> (e.g. gstreamer plugins).
>>
>> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
>> ---
>>   package/freescale-imx/freescale-imx.inc | 9 +++++++++
>>   package/freescale-imx/freescale-imx.mk  | 6 +-----
>
> I know there has been past discussion with Arnout on this, but I
> clearly don't agree with the introduction of this new .inc extension in
> our makefiles.
>
> Due to how make expands variable, I am not sure it is needed for the
> FREESCALE_IMX_VERSION and FREESCALE_IMX_SITE variables to be defined
> before they are used.
>

I can do that if I move packages/gstreamer/gst-fsl-plugins/ under
packages/freescale-imx, but not otherwise.

And as you said, we could have packages/gstreamer/Config.in
point at the new location, though that seems a bit odd.

Let me know how you'd like this handled. I just want to make
sure that everybody's using the latest and greatest code.

Regards,


Eric
