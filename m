From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 4 Dec 2013 11:24:58 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
In-Reply-To: <20131204102753.419a9057@skate>
References: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
 <CAKAx1cgki9JiRqU=zJJ0P8g5XpG7NEZN9WcBuYMa4mNyv2C-RA@mail.gmail.com>
 <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
 <CACjG4BLqXqufuzSHYWghXcZuWMpBPjbFUU7xGzLhSjQQrghK8A@mail.gmail.com>
 <CAKAx1ciXsAPtG-uegQC5CPO8yJFPG4gn7CvuzVZ2JQh_T0FrAA@mail.gmail.com>
 <20131204102753.419a9057@skate>
Message-ID: <CAKAx1chcpQCp_y8bWGvdMJB03G3JXRdFnON4s6cyoAT-=5MXnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Wed, Dec 4, 2013 at 10:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Lionel Orry,
>
> On Tue, 3 Dec 2013 09:45:15 +0100, Lionel Orry wrote:
>
>> They just released the 1.8 version, I think it's time to think about
>> the bump, but there are some quite fundamental changes between 1.7 and
>> 1.8 (most noticeable one is the merged tree instead of separate source
>> code for core libraries), and the bump is probably not that easy at
>> first, and then, I also suppose there are some applications that may
>> still need 1.7 among buildroot users.
>
> Are you sure 1.8 breaks the compatibility with 1.7 ? I don't think so.
> It's not because in terms of source code everything is now inside a
> single tarball that the compatibility for applications has been broken.

That is true, I did not explain clearly the status. But I suppose I
can then convince you that a LOT of API changes occured by looking at
the NEWS file: https://git.enlightenment.org/core/efl.git/plain/NEWS?id=v1.8.1

Among other things, EFL 1.8 now has a mandatory dependency on bullet
library, which makes it much less suitable on light embedded systems ;
for example, I think bullet is not part of buildroot packages yet.

>
>> I would then suggest to have EFL 1.7 and EFL 1.8 in parallel for some
>> time. Maybe we should create efl18 package.
>
> Before doing that, I'd like to understand how/why EFL 1.8 is
> incompatible with EFL 1.7.

Your request is justified. See above about the API compatibility.

>
>> As for EFL 1.7, maybe the easiest to do is require a toolchain with
>> threads support.
>
> I agree.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Best regards,
Lionel
