From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 27 Apr 2018 09:14:40 -0700
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store
 manifest in rootfs
In-Reply-To: <20180427154650.3710e52e@windsurf>
References: <20180426193252.19616-1-yann.morin.1998@free.fr>
 <20180427154650.3710e52e@windsurf>
Message-ID: <46b6f4f0-033e-9a67-168e-51e16e6a40d5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/27/2018 06:46 AM, Thomas Petazzoni wrote:
> Yann, Florian,
> 
> On Thu, 26 Apr 2018 21:32:52 +0200, Yann E. MORIN wrote:
>> Some users want to be able to easily ship the manifest of the legal-info
>> directly in the target filesystem.
>>
>> Those users currently hack their ways around, usign a post-build script
>> that calls back to generate legal-info; this is a bit hackish...
>>
>> Add an option to that effect.
>>
>> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> I'd like to challenge the usefulness of having the manifest on the
> target. What is the actual use case ?

The use case is primarily to have the exact list of
software/versions/licenses to be displayed in e.g: an UI "legal
disclaimer" page and possibly use parts of the manifest to issue
appropriate warnings to developers that shipping a system with GPLv3
software packages may conflict with the security mechanisms deployed on
the device.

> 
> Indeed, for license compliance of copyleft license (i.e at least GPL,
> LGPL), having the name of the software package, its version and its
> license is not sufficient, you also need to provide the full
> corresponding source code.
> 
> So what is the need for having just the manifest ? Obviously the
> complexity of the patch is low, but it's yet another Config.in option,
> so I'd like to be sure there is a real, useful use case for it.
> 
> Thanks!
> 
> Thomas
> 

-- 
Florian
