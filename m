From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 11 Nov 2014 10:14:15 +0100
Subject: [Buildroot] [PATCH v3] gst1-imx: add package
In-Reply-To: <54611576.3000803@gmail.com>
References: <1415506111-21818-1-git-send-email-bisson.gary@gmail.com>
 <5460F657.8000301@lucaceresoli.net> <54611576.3000803@gmail.com>
Message-ID: <5461D367.3050005@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary,

Gary Bisson wrote:
> Luca, All,
>
> On 11/10/2014 09:31 AM, Luca Ceresoli wrote:
>> Dear Gary,
>>
>> Gary Bisson wrote:
>>> [snip]
>>> $ gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
>>> $ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>>> matroskademux ! imxvpudec ! imxipusink
>>> $ gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
>>> matroskademux ! imxvpudec ! imxeglvivsink
>>
>> I tested it on i.MX6DL SABRESD (not Quad), based on
>> freescale_imx6dlsabresd_defconfig, but with libc changed to glibc.
>> All the three pipelines you provided work, with the first one eating up
>> ~30% of CPU time, while the other two ones take only 2~3% CPU only (but
>> play no audio of course).
>
> Good to hear everything worked out. Thanks for checking CPU consumption,
> although 30% seems high for audio handling we can clearly see the video
> is decoded through the VPU.

Isn't the first pipeline simply not using the hardware decoder?

>>> +
>>> +config BR2_PACKAGE_GST1_IMX
>>> +    bool "gst1-imx"
>>> +    depends on BR2_LINUX_KERNEL
>>
>> As per Arnout's suggestion on v2, there should be a # libfslvpuwrap
>> here.
>
> Actually I think this should not be added as this package also needs the
> kernel headers for IPU use (see source code under src/ipu).

I see. Thanks for the clarification.

-- 
Luca
