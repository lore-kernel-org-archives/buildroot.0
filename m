From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Wed, 19 May 2021 11:36:56 +0000
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <20210519120237.52ddc109@windsurf.orange-hotspot>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
 <20210519093323.GL2268078@scaer>
 <20210519120237.52ddc109@windsurf.orange-hotspot>
Message-ID: <223d3cbf-f1cb-4bdc-aff6-f766e428da33@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/19/21 1:02 PM, Thomas Petazzoni wrote:
> Hello Yann,
> 
> On Wed, 19 May 2021 11:33:23 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> This introduces two issues.
>>
>> First, and most important: this means that we now have two "known
>> versions". However, you forgot to account for the licensing stuff. We
>> use main.c as a substitute for a license file, but of course main.c
>> differs between 4.x and 3.x...
>>
>> We could carry a per-version hash file, but using main.c as a license
>> file is really just hidding the issue. IOnstead, I've dropped it
>> altogether.
> 
> Aaah, yes, indeed. Thanks for spotting/detecting that.
> 
>> Eugen, Nicolas (and Simon?): would you care to add an actual license
>> file to your repository, please?
> 
> Agreed, Eugen and Nicolas: it would really be better to have a proper
> LICENSE file in your repo. Please add it to both the 3.x branch and the
> 4.x branch :-)

Hi,

Thank you for taking care of this. You could have given me more feedback 
on my previous patch set so I would have changed it, if you felt like 
it, but now it's done, we can move forward, which is good.
I will add a LICENSE file in the repo soon.

Thanks,
Eugen

> 
>> The second issue is less of an issue: there were two defconfigs that use
>> the default 3.x version. Without a tweak, they would have switched over
>> to using 4.x. So I pinned them with BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X.
> 
> Aah, yes, well spotted. I think we should ask the contributor of these
> defconfigs to use a fixed version of AT91Bootstrap, because that's
> normally what we do for bootloader/kernel versions in defconfigs.
> 
>> With the aboce two issues adressed: applied to next, thanks.
> 
> Many thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
