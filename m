From: James Hebden <james@hebden.net.au>
Date: Fri, 13 Feb 2015 09:01:56 +1100
Subject: [Buildroot] [PATCH 1/1] Add default configuration for Raspberry
 Pi 2 (ARMv7 & NEON)
In-Reply-To: <20150212210330.GC4277@free.fr>
References: <20150211175219.22579465@hebden.net.au>
 <20150212190940.GA4277@free.fr>
 <CA+-urNQusdwq8S_UeMLttY22+v8mzUrFQy4cYyOtzs3q7TOKRA@mail.gmail.com>
 <20150212210330.GC4277@free.fr>
Message-ID: <54DD22D4.3080601@hebden.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/02/15 08:03, Yann E. MORIN wrote:
> Frank, All,
>
> On 2015-02-12 15:51 -0500, Frank Hunleth spake thusly:
>>>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rpi-3.18.y-rebase"
>>>
>>> We can not use a branch name here. We want either a tag or a sha1.
>>> Currently, this is 0be82f722c097340632a59b879fbfee9c6148f53.
>>
>> Regarding the Raspberry Pi kernel version, what's the difference
>> between using the tip of the rpi-3.18.y branch and the tip of the
>> rpi-3.18.y-rebase branch? The kernel source code looks the same
>> between branches except for some trailing whitespace in files. Is the
>> rpi-3.18.y branch safe from rebases?
>
> No, the rpi-3.18.y is *not* safe from rebase; in fact, it is "constantly"
> rebased. That's a shame. :-(
>
> As for the rpi-3.18.y-rebase branch, I have absolutely no idea what it
> is meant for:
>    - is it a temporary branch that got pushed (it did not exist until a
>      few days ago)?
>    - is it the branch that will be rebased, leaving rpi-3.18.y alone?
>    - something else?
>
> So, I would prefer we stick to using the rpi-3.18.y (or even the
> rpi-3.19.y) branch, since we pretty much know how they handle it.
>
> /me should probably go and bug the RPi guys to put some tags on their
>      branches from time to time...
>
> Regards,
> Yann E. MORIN.
>

Thanks everyone for reviewing the patch and all of your helpful advice - 
much appreciated.

I'll resubmit the patch shortly, I'm just testing an image compiled with 
everyone's suggestions.

I've
  * Removed the custom kernel config, I'm now using bcm2709_defconfig.
  * Switched to the current tip of the rpi-2.19.y branch, using the 
commit ref instead of branch name. At the time I composed the patch I 
recall the rpi-3.18.y-rebase branch having a few more RPi2 related 
fixes, hence the choice. They seem identical now.
  * Cut down the size of the buildroot defconfig I've created. It's a 
proper defconfig now.
  * Switched to EABIhf. I recall testing this and not being able to get 
the image to boot, and meaning to switch it back on once I got the image 
booting. Good catch :)
  * Removed the rpi-firmware version change - I'll also be submitting a 
separate patch to bump the rpi-firmware package to the required level.

Sorry about the patch formatting - I had tried git send-email maybe a 
dozen times before resorting to using my mail reader to send the patch. 
Didn't noticed the wrapped lines until now - so I'll give git send-email 
another try.

Thanks,
James
