From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 4 Sep 2020 10:31:30 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <CAFSsvmphBJ-8pymoxdoG-sp_=NG4MRsZP=sV__7A4uE9EuhyCw@mail.gmail.com>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <CAFSsvmphBJ-8pymoxdoG-sp_=NG4MRsZP=sV__7A4uE9EuhyCw@mail.gmail.com>
Message-ID: <2bebfe82-46e5-332c-229e-d8344bf71f1b@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/2020 19:29, Adam Duskett wrote:
>> That's what we want. With the ML this is simply impossible.
>> We should aim to review patches that are already checked, that we know
>> are compiling for all the architectures, that respect some rules in
>> the commit message.
> 
> And having a simple CI/CD pipeline for these tasks would also reduce
> the amount of time
> AND the number of arbitrary opinions on styling and testing, which
> would mean less
> work for the few maintainers there are.

Except this wouldn't change anything. checkpackage doesn't check much (judging
by the amount of changes the maintainers do to 80% of my patches),
and test-pkg cannot be run automatically, because it expects a config
with the package and its dependencies.

Plus, to be really useful, test-pkg must be run multiple times with various
dependencies and/or reverse dependencies, and at that point, this simply
reinvents the autobuilders.

Improving checkpackage and test-pkg would already benefit email-based workflows,
and it is perfectly possible to have a bot reply to a patch series if it doesn't
compile. This already happens in Linux.

And about the initial question: if buildroot need more maintainers or changes
its workflow, maybe it should look at how Linux distributions do things, rather
than how big projects do things.
