From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Aug 2020 09:20:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-08-18
In-Reply-To: <1af22d4f-2280-749b-351a-819d245251c5@ideasonboard.com>
References: <5f3cda7b.1c69fb81.e5841.2292SMTPIN_ADDED_MISSING@mx.google.com>
 <1af22d4f-2280-749b-351a-819d245251c5@ideasonboard.com>
Message-ID: <a40c1a30-520a-4d98-b3eb-a96141a26dbe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/08/2020 11:51, Kieran Bingham wrote:
> Hi Thomas, Fabrice,
> 
> This autobuilder failure is still on going for M68k
> 
> It relates to an assertion which only seems to fire on the m68k
> regarding a ControlValue which we serialise, and therefore (currently)
> require to know it's exact size.
> 
> 
> -Wnon-virtual-dtor -Wextra -Werror -std=c++14 -O3 -Wno-unused-parameter
> -include config.h -faligned-new -fPIC -pthread -MD -MQ
> src/libcamera/libcamera.so.p/controls.cpp.o -MF
> src/libcamera/libcamera.so.p/controls.cpp.o.d -o
> src/libcamera/libcamera.so.p/controls.cpp.o -c ../src/libcamera/controls.cpp
> ../src/libcamera/controls.cpp:92:36: error: static assertion failed:
> Invalid size of ControlValue class
>  static_assert(sizeof(ControlValue) == 16, "Invalid size of ControlValue
> class");
> 
> I assumed that this happens because the m68k is 32 bit, but of course we
> already successfully compile on other 32 bit architectures, so I'm not
> sure of the underlying change of size.

 I haven't looked at it at all, but if ControlValue is a struct, it's more
likely caused by padding.


> Anyway, I'm quite certain we wouldn't expect libcamera to run on an
> m68k. What's the easiest way to disable libcamera support for that target?
> 
> Should the have an architecture specific depends on !m68k or such in
> Config.in, or is there a better way to handle this?

 Yes, if you don't want to bother with fixing an issue, just add a !m68k with a
small comment (e.g. "# Invalid size of ControlValue") and all of the explanation
above in the commit message.

 Regards,
 Arnout

> 
> Regards
> --
> Kieran
> 
> 
> 
> On 19/08/2020 08:53, Thomas Petazzoni wrote:
>> Hello,
>>
>> Autobuilder failures
>> ====================
>>
>> Below is a list of build failures reported by the Buildroot
>> autobuilders in relation to packages or CPU
>> architectures you are in charge of. Please help us
>> improving the quality of Buildroot by investigating
>> those build failures and sending patches to fix
>> them.Thanks!
>>
>> Results for the 'next' branch
>> -----------------------------
>>
>> Build failures related to your packages:
>>
>>     arch     |             reason             |                                       url                                      
>> -------------+--------------------------------+---------------------------------------------------------------------------------
>>     m68k     | libcamera-565f95d64ff92e871... | http://autobuild.buildroot.net/results/40e8facc805b3eaac5fe6c95db0cd7b756eb1f18
>>
>>
> 
