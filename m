From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jun 2021 21:25:16 +0200
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <ae8d98c6-dce4-5342-1f15-39b2be3fa31c@microchip.com>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
 <20210519093323.GL2268078@scaer>
 <20210519120237.52ddc109@windsurf.orange-hotspot>
 <223d3cbf-f1cb-4bdc-aff6-f766e428da33@microchip.com>
 <20210519142051.6e84a675@windsurf.orange-hotspot>
 <c41d4467-2901-7b32-96cd-4d7d63753223@microchip.com>
 <ae8d98c6-dce4-5342-1f15-39b2be3fa31c@microchip.com>
Message-ID: <9c4119ca-96a6-24a7-f993-32068ce1165f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/06/2021 11:01, Eugen.Hristev--- via buildroot wrote:
> On 5/19/21 3:29 PM, Eugen Hristev - M18282 wrote:
>> On 5/19/21 3:20 PM, Thomas Petazzoni wrote:
>>> Hello Eugen,
>>>
>>> On Wed, 19 May 2021 11:36:56 +0000
>>> <Eugen.Hristev@microchip.com> wrote:
>>>
[snip]
>>>> I will add a LICENSE file in the repo soon.
>>>
>>> That would be awesome. Could you add it to both the 3.x and the 4.x
>>> branches ? It would be nice to have another release on the 3.x branch
>>> that includes the LICENSE file.
>>
>> Yes, I would do it for both branches. We have to agree on the format of
>> the LICENSE first.
> 
> Hello Thomas,
> 
> Do you know of some easy way (a script) to parse the source files and 
> remove current header and add SPDX headers ?
> We are considering selecting the SPDX way of licensing the files.

 I believe the REUSE tool [1] is able to add license headers to files. However,
I don't think it will remove the existing license blurb...

 You could check with the kernel developers how they did the mass replacement. E.g.:

commit d2912cb15bdda8ba4a5dd73396ad62641af2f520
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Tue Jun 4 10:11:33 2019

    treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 500

    Based on 2 normalized pattern(s):

      this program is free software you can redistribute it and or modify
      it under the terms of the gnu general public license version 2 as
      published by the free software foundation

      this program is free software you can redistribute it and or modify
      it under the terms of the gnu general public license version 2 as
      published by the free software foundation #

    extracted by the scancode license scanner the SPDX license identifier

      GPL-2.0-only

    has been chosen to replace the boilerplate/reference in 4122 file(s).

    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Reviewed-by: Enrico Weigelt <info@metux.net>
    Reviewed-by: Kate Stewart <kstewart@linuxfoundation.org>
    Reviewed-by: Allison Randal <allison@lohutok.net>
    Cc: linux-spdx at vger.kernel.org
    Link: https://lkml.kernel.org/r/20190604081206.933168790 at linutronix.de
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



 Regards,
 Arnout

[snip]
