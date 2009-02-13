From: Eric Malkowski <eric@bvwireless.net>
Date: Thu, 12 Feb 2009 21:05:00 -0500
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <20090213001000.GA22653@cloud.net.au>
References: <49907BAE.3020509@ethertek.ca> <20090212132945.GA30222@zelow.no>
	<20090213001000.GA22653@cloud.net.au>
Message-ID: <4994D54C.103@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Thu, Feb 12, 2009 at 02:29:45PM +0100, Thomas Lundquist wrote:
>   
>> On Mon, Feb 09, 2009 at 10:53:34AM -0800, Dan Pattison wrote:
>>     
>>> Hello List:
>>>
>>> I've been getting used to the buildroot development environment using 
>>> 2009.02-RC2 for ARM AT91SAM9g20-EK. I have made lots of changes and 
>>> additions that suit our project (config files, packages, etc.) We have 
>>> successfully compiled and included some of our own programs.
>>>
>>> What is the recommended method to upgrade to the newest build 
>>> environment so we don't have to re-do everything? Is this possible?
>>>       
>> Ulf introduced local/ when he started to commit and this was a good idea.
>>
>> It got booted out some time later, by someone.
>>
>> The point is that you can put your config files and non-included 
>> packages there and keep that out of the rest of the tree.
>>
>> I like the idea and would like to put it back in.
>>     
>
> I'm using local/ a lot in my own development. I have config files
> (buildroot, busybox, linux, uClibc), the device table and the
> target_skeleton in there.
>
> There wasn't any support for additional packages via local/ although it
> would be useful - I had to modify the top level makefiles to add such a
> section here, making maintenance more difficult.
>
>
> Hamish
>   
That's exactly where I was going w/ the patch I just posted.
w/ my patch, you can specify at the various locations in "make 
menuconfig" each of the items you mentioned (patch adds ability to 
specify target_skeleton and device table for which I didn't see anywhere 
in there one could do that)

local/project/buildroot.config
local/project/busybox.config
local/project/linux.config
local/project/uClibc.config
local/project/target_skeleton
local/project/device_table.txt

I would think for a lot of setups out there, the above would cover most 
people's needs.

I follow the standard docs for adding software under package/ and tweak 
of package/Config.in so it appears in the config menus.
Doing this minimizes changes needed to buildroot beyond what's 
documented for extending buildroot and provides all of the control I 
need for total customization.

-Eric
