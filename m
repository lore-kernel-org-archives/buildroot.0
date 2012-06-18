From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 18 Jun 2012 18:22:23 +0100
Subject: [Buildroot] RFC: x11r7.7 patch series
In-Reply-To: <20120618162156.23914f96@skate>
References: <4FDF2526.70901@carallon.com> <20120618162156.23914f96@skate>
Message-ID: <4FDF63CF.4090702@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/06/2012 15:21, Thomas Petazzoni wrote:
> Le Mon, 18 Jun 2012 13:55:02 +0100,
> Will Wagner<will_wagner@carallon.com>  a ?crit :
>
>> You can find my work on updating to x11r7.7 on gitorious at
>> https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7
>>
>> There are a few parts to the patch series I am not sure about:
>> - I have deleted all packages not in the 7.7 release, this may remove
>> things people still use and feel should still be in buildroot
>
> Most likely if they have been removed upstream, they are unmaintained,
> and we should remove them as well.
>
> I've seen that a fair amount of packages are removed, but I haven't
> seen any new package. Is this normal? No new components in 7.7 compared
> to the older release we have in BR?

I do not believe they have added any apps since 7.5

I used this link http://www.x.org/releases/X11R7.7/src/ and made sure 
that every package listed there was built in buildroot.

>
>> - I had a problem updating mesa3d. The newer versions rely on host
>> libxml2 with python support. There are a couple of patches to do this
>> but I don't particularly like these. If someone can come up with
>> something better then great.
>
> Erk. I've seen what you've done, and even though is certainly the
> easiest solution, I don't like it a lot. Until now, we have tried to
> avoid the need for options on host packages...
>
> Do you have some details on why the mesa3d package needs libxml2 with
> python support?

I have not gone into too much detail, however it seems like the build 
process auto generates some part of the code from a python script (See 
http://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/main/APIspec.py)

I could not find any config option to not regenerate this and instead 
use a prebuilt one, but perhaps I wasn't looking in the right place.

>
>> - There was one package I couldn't compile
>> xdriver_xf86-input-synaptics. Didn't spend any time on trying to fix
>> it though (I suspect broken in current buildroot as well).
>
> Ok.
>
> Regards,
>
> Thomas


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
