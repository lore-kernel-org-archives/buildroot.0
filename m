From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Sep 2014 16:41:33 +0200
Subject: [Buildroot] [PATCH v4 0/4] Improvements to i.MX6 SABRESD boards
 support
In-Reply-To: <542020B1.60500@lucaceresoli.net>
References: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
 <20140921212519.296ade2a@free-electrons.com>
 <542020B1.60500@lucaceresoli.net>
Message-ID: <5420351D.9050802@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Luca Ceresoli wrote:
> Dear Thomas,
>
> thanks for your suggestions.
>
> Thomas Petazzoni wrote:
>> Dear Luca Ceresoli,
>>
>> On Fri, 19 Sep 2014 16:12:48 +0200, Luca Ceresoli wrote:
>>
>>> Luca Ceresoli (3):
>>>    configs/freescale_imx6qsabresd: rename imx6 to imx6q
>>>    configs/freescale_imx6dlsabresd: add defconfig for iMX6DL SabreSD
>>>    freescale/imx6-sabresd: document how to create a bootable SD
>>>
>>> Vincent Stehl? (1):
>>>    imx6sabresd: boot to /init in mfgtools mode
>>
>> I've applied your four patches. However, I'd like to see additional
>> patches to make the following improvements:
>>
>>   * For the defconfigs, select a specific version of the kernel headers.
>>     Currently, your defconfigs are building a 3.10 kernel, but the
>>     kernel headers used in the toolchain are the latest ones (i.e 3.16
>>     currently), which is not good. This was already wrong in the
>>     existing defconfig, so I applied your patches nonetheless. But it
>>     should be fixed.
>
> I'm working on this. I switched from Freescale's git repo to vanilla
> Linux, since the Freescale releases do not provide any later version.

...or maybe I'll do the other way around: use the kernel headers from
Freescale's custom git repo, since the defconfig we currently use
(imx_v7_defconfig) is not available in mainline, and the closest one
in mainline (imx_v6_v7_defconfig) has several differences, and I'd like
to keep things simple and working.

I wonder if there's a good reason to use a mainline kernel instead.

-- 
Luca
