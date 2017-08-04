From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 18:41:38 +0200
Subject: [Buildroot] Howto handle fork of an existing package
In-Reply-To: <20170804164145.21595c6d@windsurf.lan>
References: <6947b9e4-bf6e-ace7-c8c9-e440a494e225@gmail.com>
 <20170804164145.21595c6d@windsurf.lan>
Message-ID: <3712be4a-076a-25b1-2f46-e25acb31d856@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 16:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 4 Aug 2017 14:21:26 +0200, Atilla Filiz wrote:
> 
>> I have made a package of Wiring Pi for Lemaker boards Banana Pi and 
>> Banana Pro. Since this is a fork from an older version, the site, teh 
>> versioning, the patches etc are all different. I would like to ask, 
>> whoat would be the best way to merge this package properly. Either
>>
>> 1. Make it a completely new package, like wiringpi-lemaker and make it 
>> depend on !BR2_PACKAGE_WIRINGPI and vice versa. Easiest way.
>>
>> 2. Turn wiringpi into a subtree, with a radio button for board 
>> selection: Raspberry Pi, Banana Pi, Banana Pro and enable teh proper 
>> package. Raspberry Pi being the default option. Slightly intrusive way.
>>
>> 3. Have one wiringpi to rule them all. Make the board selection as a 
>> mere set of parameters. Make a bit more complicated wirinpi.mk that 
>> selects correct site, version, patch directory etc depending on a bunch 
>> of defined flags. Possibly unnecessarily complicated.
> 
> 4. Contribute to the official wiringpi project instead of doing a fork,
> so that a single project supports multiple platforms.

 Tell that to the LeMaker people, not to Atilla. And while you're at it, tell
the RaspberryPi people to not fork the kernel interfaces so that there is no
need to create a library that has to be forked for RaspberryPi-derivatives...


> I think I have a preference for option (4). If not possible, option (3)
> will be acceptable, but not as nice :-)

 Essentially there is no real relationship between the proprietary GPIO
interface for RPi and the *different* proprietary GPIO interface for BPi, so I
wouldn't mind solution (1). It's a different upstream with a potentially
different API...

 By the way, upstream says:
"This is a modified WiringPi for Banana Pro/Pi. We call it WiringBP."
So naturally, the package should be called wiringbp.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
