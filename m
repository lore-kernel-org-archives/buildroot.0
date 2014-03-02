From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 2 Mar 2014 15:49:22 +0100
Subject: [Buildroot] Structure of the Buildroot manual
In-Reply-To: <CAAXf6LURroMMeqV=RoJhXTzN=tV+wJFzKwzrOv+ADevXvrnUzA@mail.gmail.com>
References: <20140223161339.3b42f921@skate>
 <CAAXf6LURroMMeqV=RoJhXTzN=tV+wJFzKwzrOv+ADevXvrnUzA@mail.gmail.com>
Message-ID: <CAHXCMMJxYVzGLRYEXyaq1HsfsnmKr4YJTM1vs-Xr4wJ3HUjjSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas (both), all,

On Sun, Mar 2, 2014 at 1:13 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Thomas,
>
> On Sun, Feb 23, 2014 at 4:13 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> Today I've written a few updates to the Buildroot manual, and I find
>> its structure a bit weird.
>>
>> The "Daily use" section in "Working with Buildroot" is just a random
>> list of facts, with no real connection with each other, and the
>> difference with "Advanced usage" in "Going further in Buildroot's
>> innards" is not really clear. This section "Going further in Buildroot's
>> innards" has a first chapter, 6.1 that really talks about Buildroot
>> internal, but the biggest part of the section, 6.2, is not at all about
>> Buildroot internals. It's much more a set of tips and descriptions of
>> slightly advanced features... a bit like the "Daily use" section.
>>
>> Similarly the "3.2 make tips" section is a random set of facts, which
>> could more or less fit into the "3.5 Daily use" section.
>>
>> I think we have some good content for the Buildroot manual, but the
>> structure is somewhat weird. Maybe it's time to refresh its structure,
>> after analyzing the information that we have, and in which order it
>> should be presented. I'm sure Thomas DS would have a lot of useful
>> ideas in this area :-)
>>

Indeed, I fully agree.

Since I started reworking the structure of the manual, a couple of
things have changed. ;)

Few observations:
- the line between "Daily use", "Advanced usage" and the "Buildroot's
innards" is quite blurred, and may vary depending on the usage one
does with Buildroot;
- when I started reorganizing the manual, my main experience with BR
was adding packages, not that much about adding board support... so,
the structure of the manual may a bit reflects this;
- I see 3 main ways of using BR:
  - as package integrator: adding packages, fixing autobuilder issues,
developping infra for new package types, etc;
  - as bsp developper: using BR to develop kernel and bootloader
support for some specific targets;
  - as bsp user: using BR as a tool provided with the board he/she
get, and who just wants to develop his/her project re-using some
defconfig and customizing its rootfs (like in the Open Silicium
article [1], sorry for non-French speakers, this is a French magazine
;-]).

I tend to think that we should have sections addressing these
use-cases explaining these tips or referring to them, but I don't see
yet how exactly this could be cleanly organized because many
things/tips can be useful for several use-cases...

Maybe the sections "Daily use", "Advanced usage" and the "Buildroot's
innards" should be merged into a single one listing/explaining the
tips and innards; those being referred to from the use-cases sections.

That's just a raw suggestion.

Any comment, suggestion, feedback, feeling on this is more than
welcome from anyone (long term developers, new comers, etc)!


[1] http://boutique.ed-diamond.com/open-silicium/548-open-silicium-10.html


Best regards,

-- 
Samuel
