From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 19:25:07 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 (Adam Duskett's message of "Sat, 5 Sep 2020 09:20:30 -0700")
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
Message-ID: <87363wjfv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

Hi,

 >> >> So yes, lets please discuss concrete improvements to the automation
 >> >> checks we already have or ways to get more people to help review rather
 >> >> than yet another discussion about the merits of pull requests versus
 >> >> emails.
 >> 

 > Commit 9faba29108e74eb4acab21f5919dfab0288b23ac broke systemd with
 > busybox in the stock Buildroot configuration.

Indeed, like discussed last week:

http://lists.busybox.net/pipermail/buildroot/2020-August/290576.html

And announced as a reply to the 2020.02.5 announcment:

http://lists.busybox.net/pipermail/buildroot/2020-August/290584.html

 > An incredibly simple test:
 > Download the tarball
 > select systemd
 > make

 > Not only was this incredibly embarrassing yesterday when I was showing a
 > client how to update Buildroot, but it could have been prevented with a basic
 > CI/CD test.

Improvements to our test automation are always welcome. This has still
not triggered on the autobuilders:

http://autobuild.buildroot.net/?branch=2020.02.x&reason=busybox-%


 > I don't have to mention how much guff I would have received from
 > the maintainers if I had submitted a patch like that without a simple test.

Accidents happen, certainly with such hidden dependencies - Which is
part of the reason we have the autobuilders. For all the ~40 LTS
releases I have done, this is afaik the first time we had such an issue.


 >> > Probably with a very extensive test matrix, it could be possible to
 >> > allow very small patches to be merged automatically to "next" with a
 >> > qualifying # of reviewed-by?
 >> 
 >> More testing is certainly good, but aren't those "very small patches"
 >> already getting applied to next pretty fast? Actually applying a patch
 >> is a single git command so that doesn't take a long time.
 >> 
 > I have had several small patches in the past sit for months if not almost years
 > before being applied. Including an OpenJDK bump that took over 3 months.

 > In fact, just looking at the list right now, a simple patch that has
 > been reviewed
 > AND tested is still sitting from 2019:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20191029095736.16586-1-fontaine.fabrice at gmail.com/

 > Here's another:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20191109185512.24139-2-jeremy.rosen at smile.fr/

That patch series was discussed in detail in Lyon last year, and should
probably just be marked as rejected.


 > Here's a simple test:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20191112162325.529637-2-m.niestroj at grinn-global.com/

 > So this is demonstrably false, which is why a lot of us are growing
 > more frustrated.

Nobody is claiming that we are perfect or that there isn't a patch
backlog, but given that we merge ~500 patches/month I still would say
that it IS generally true.

Anyway, Thomas has sent out a mail for a live discussion for next week,
so lets take the discussion there.

-- 
Bye, Peter Korsgaard
