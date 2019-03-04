From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 08:28:22 +0100
Subject: [Buildroot] Bazel integration in buildroot
In-Reply-To: <CALFsTFWqzGmcVBEjh7OMq7K2hfQCNOp_RtUbeuT2vVPSnYq9+Q@mail.gmail.com>
References: <CALFsTFU49uLC3aW+O62_oqa2v-tGeT8ZEqMpRjybSBcy4eGSWQ@mail.gmail.com>
 <20190301121938.GA21608@lwo1-lhp-f71841>
 <CALFsTFWqzGmcVBEjh7OMq7K2hfQCNOp_RtUbeuT2vVPSnYq9+Q@mail.gmail.com>
Message-ID: <6c95a20b-8b5e-c007-db8b-ac35aa2e7751@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/03/2019 16:33, Asaf Kahlon wrote:
> Hello Vadim,
> 
> On Fri, Mar 1, 2019 at 2:19 PM Vadym Kochan <vadim4j@gmail.com> wrote:
>>
>> Hi Asaf,
>>
>> On Sun, Feb 24, 2019 at 06:24:40PM +0200, Asaf Kahlon wrote:
>>> Hello,
>>>
>>> At my work we started a process in which we want to choose a construction
>>> tool for our packages. Of course all the traditionals are on the list like
>>> cmake, meson and others, but we're also looking at Bazel from Google.
>>> All in all, Bazel seems like a nice construction tool, but I noticed that
>>> there's not even one package in Buildroot that compiles with Bazel and I
>>> wanted to know if we missed something. Is someone here familiar with this
>>> build system and can elaborate more details on Bazel in the embedded world
>>> and specifically in Buildroot?

 The big question is: does Bazal support cross-compilation? If it does, using
Bazel for building in Buildroot should be easy enough.

>>>
>>> Regards,
>>> Asaf.
>>
>> First of all I am not an expert, but I have some thoughts about this:)
>>
>> It looks like bazel is a Java application ? if so, then there will one
>> more (I think big) dependency like Java on the host to build the bazel's
>> packages, or it may be built by openjdk buildroot's package (which is

 We can have conditionals in dependencies.sh. E.g. the "locale" program is a
dependency if BR2_NEEDS_HOST_UTF8_LOCALE=y.

>> not merged yet). Actually, bazel packages support might be added for local
>> usages only.
>>
>> Anyway it is better if some of the buildroot experts can answer this question.
>>
>> Regards,
>> Vadim Kochan
> 
> Thanks for the response!
> I think too it would require a non-trivial change.

 We typically start with creating a few packages that use the build system
before creating infra for it. And in some cases we simply don't create infra,
e.g. for qmake.

 Regards,
 Arnout


> I'll be happy to hear from other Buildroot experts too.
> 
> Thanks,
> Asaf.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
