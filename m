From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 4 Dec 2013 13:56:57 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
In-Reply-To: <CAKi4VA+DNiMCiPFYE1VOMUOT2vJNo2fDReO7zcuPYni2uBB1cw@mail.gmail.com>
References: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
 <CAKAx1cgki9JiRqU=zJJ0P8g5XpG7NEZN9WcBuYMa4mNyv2C-RA@mail.gmail.com>
 <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
 <CACjG4BLqXqufuzSHYWghXcZuWMpBPjbFUU7xGzLhSjQQrghK8A@mail.gmail.com>
 <CAKAx1ciXsAPtG-uegQC5CPO8yJFPG4gn7CvuzVZ2JQh_T0FrAA@mail.gmail.com>
 <20131204102753.419a9057@skate>
 <CAKAx1chcpQCp_y8bWGvdMJB03G3JXRdFnON4s6cyoAT-=5MXnQ@mail.gmail.com>
 <CAKi4VA+DNiMCiPFYE1VOMUOT2vJNo2fDReO7zcuPYni2uBB1cw@mail.gmail.com>
Message-ID: <CAKAx1chAHbsMbbyqPCduYDDgyRPLZQytPhzF4soVTC6tsptaPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lucas and Thomas,

On Wed, Dec 4, 2013 at 1:21 PM, Lucas De Marchi
<lucas.de.marchi@gmail.com> wrote:
> On Wed, Dec 4, 2013 at 8:24 AM, Lionel Orry <lionel.orry@gmail.com> wrote:
>> Dear Thomas,
>>
>> On Wed, Dec 4, 2013 at 10:27 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Lionel Orry,
>>>
>>> On Tue, 3 Dec 2013 09:45:15 +0100, Lionel Orry wrote:
>>>
>>>> They just released the 1.8 version, I think it's time to think about
>>>> the bump, but there are some quite fundamental changes between 1.7 and
>>>> 1.8 (most noticeable one is the merged tree instead of separate source
>>>> code for core libraries), and the bump is probably not that easy at
>>>> first, and then, I also suppose there are some applications that may
>>>> still need 1.7 among buildroot users.
>>>
>>> Are you sure 1.8 breaks the compatibility with 1.7 ? I don't think so.
>>> It's not because in terms of source code everything is now inside a
>>> single tarball that the compatibility for applications has been broken.
>
> No, it doesn't break compatibility. If it did it would be called efl 2.x
>
> There's a huge change in the underlying implementation of the object
> model with the introduction of EO, but it should be API/ABI compatible
> with EFL 1.7.
>
>>
>> That is true, I did not explain clearly the status. But I suppose I
>> can then convince you that a LOT of API changes occured by looking at
>> the NEWS file: https://git.enlightenment.org/core/efl.git/plain/NEWS?id=v1.8.1
>
> APIs were added. Removals were made in a backward compatible manner.
>

Thank you Lucas for answering the thread as one of the core devs. I
saw a list of removals and did not think they could have been
backward-compatible. If they are, then I was just making noise, sorry.
You all did a great job with this release, I know that for sure.

>>
>> Among other things, EFL 1.8 now has a mandatory dependency on bullet
>> library, which makes it much less suitable on light embedded systems ;
>> for example, I think bullet is not part of buildroot packages yet.
>
> that is not true. You can perfectly pass --disable-physics so the
> dependency goes away.

I just checked actually, and I apologise for this again. I remember a
time when it was mandatory and did not notice it became optional.

>
>
> Lucas De Marchi

With kind regards,
Lionel
