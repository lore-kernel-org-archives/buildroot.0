From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 27 Apr 2018 09:41:59 -0700
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store
 manifest in rootfs
In-Reply-To: <20180427163130.GD2471@scaer>
References: <20180426193252.19616-1-yann.morin.1998@free.fr>
 <20180427154650.3710e52e@windsurf>
 <46b6f4f0-033e-9a67-168e-51e16e6a40d5@gmail.com>
 <20180427163130.GD2471@scaer>
Message-ID: <47141054-2a88-231d-288d-59734b3d1df6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/27/2018 09:31 AM, Yann E. MORIN wrote:
> Florian, All,
> 
> On 2018-04-27 09:14 -0700, Florian Fainelli spake thusly:
>> On 04/27/2018 06:46 AM, Thomas Petazzoni wrote:
>>> Yann, Florian,
>>>
>>> On Thu, 26 Apr 2018 21:32:52 +0200, Yann E. MORIN wrote:
>>>> Some users want to be able to easily ship the manifest of the legal-info
>>>> directly in the target filesystem.
>>>>
>>>> Those users currently hack their ways around, usign a post-build script
>>>> that calls back to generate legal-info; this is a bit hackish...
>>>>
>>>> Add an option to that effect.
>>>>
>>>> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>>>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>>>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>>
>>> I'd like to challenge the usefulness of having the manifest on the
>>> target. What is the actual use case ?
>>
>> The use case is primarily to have the exact list of
>> software/versions/licenses to be displayed in e.g: an UI "legal
>> disclaimer" page
> 
> So, presumably you would also have that page display a URL where to find
> all the rest of the legal-info, right?

Yes.

> 
> This use-case is IMHO really valid: you want to inform the end user of
> their rights, give the minimum relevant info, and point outside for the
> big parts.

I think so too.

> 
>> and possibly use parts of the manifest to issue
>> appropriate warnings to developers that shipping a system with GPLv3
>> software packages may conflict with the security mechanisms deployed on
>> the device.
> 
> There, I disagree. That should be part of a CI job to run legal-info for
> each build, and parse the manifest to find things you don't like.

Well of course, but the idea is also to make sure that someone gets a
chance to see a warning if they accidentally decided to ship a
development rootfs to someone. Anyhoo, first use case described is the
intended one FWIW.

> 
> Regards,
> Yann E. MORIN.
> 
>>> Indeed, for license compliance of copyleft license (i.e at least GPL,
>>> LGPL), having the name of the software package, its version and its
>>> license is not sufficient, you also need to provide the full
>>> corresponding source code.
>>>
>>> So what is the need for having just the manifest ? Obviously the
>>> complexity of the patch is low, but it's yet another Config.in option,
>>> so I'd like to be sure there is a real, useful use case for it.
>>>
>>> Thanks!
>>>
>>> Thomas
>>>
>>
>> -- 
>> Florian
> 

-- 
Florian
