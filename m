From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 5 Feb 2007 12:19:49 +0100
Subject: [Buildroot] Fw:  AVR32 support in Buildroot
Message-ID: <016001c74918$278440d0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Looks like you sent that mail from "ulfs at atmel" which doesn't exist,
> according to some MX.
>
> Anyway. Here we go again..
>

> On Sat, Jan 27, 2007 at 12:17:34AM +0100, Ulf Samuelsson wrote:
>>Bernhard Fischer wrote:
>>>On Fri, Jan 26, 2007 at 12:00:15AM +0100, Ulf Samuelsson wrote:
>>>>>
>>>>>I planned to keep the previous stable release, so 2.16 will stay
>>>>>for a while, but can't you merge the avr32 stuff with HJ and with
>>>>>upstream?
>>
>>Small comment to above...
>>
>>
>>We have customers which are looking at 10-20 year maintenance cycles.
>>Their end customer does not want to have different versions
>>of S/W running, so if they upgrade, they need to upgrade everything.
>
> Which is a good thing since then you'll get current SW to use.

I agree that you want to have the possibility to do an upgrade
but I think that people would want to have a choice to upgrade or not.
What happens if a company is running linux-2.4 and the latest
package version is only supporting linux-2.6.
They might want to run an older version of that package
and backport neccessary changes to this older version.
It is really not possible right now.

I talked to someone off list, and he would like the complete
makefile fragment to be removed because he needed to run
another version.

>>What is the benefit of removing support for things that people still need?
>>The only thing I can see is that the tarball would become smaller.
>
> So i'll leave the ancient stuff in there but wrap it in a
> BR2_DEPRECATED, fine with me.

Thanks!

>>
>>As part of easier maintenance, I think it would be good
>>if the patch structure was standardized.
>>
>>Today I have found three versions in buildroot.
>>
>>* All patches stored in "package/<package>" directory are applied
>>* All patches stored in "package/<package>/<version>" directory are 
>>applied
>>* All patches stored in "package/<package>" directory
>>       named "<package>-<version>-*" are applied.
>>
>>I think it would be good to standardize on a single method
>>and storing the patch in a subdirectory called <version> is
>>my preferrred way.
>
> the $package/$version/*patch approach wastes quite some dentries on the
> buildhost and isn't really clear to spot which patches exist. Ignoring
> the former, i consider the latter a downside of that approach, so would
> suggest to use $package-$version-\*patch
>
> Sounds ok?

I am basically fine with any structured approach, but would you really
want to see this approach for the toolchain directories.
There is going to be a very large number of gcc patches in a certain 
directory.
I think your suggestion works when you have a few versions but
it becomes unwieldy when you have many.

Most important is to have a single approach though.
I could not care about the "dentries" and ?f I want
to view a patch, then I just go down in the subdirectory.

I think it would be very interesting to find out other people's view on 
this.

> Let's please discuss this aspect on-list.
>
> PS: Feel free to drop your 10-20 years maintenance comment and fwd my
> comment to the list.
>
>
> ----- End forwarded message -----
> 
