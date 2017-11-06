From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 6 Nov 2017 16:41:56 -0500
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <20171106221202.2d23dac4@windsurf>
References: <20171030163121.939-1-norbert.lange@andritz.com>
 <20171030204054.723cdc99@windsurf>
 <CADYdroP3-gaXzRy61r7FraPq+g6MeB5CUGN_nFLyFy3MxxfVvw@mail.gmail.com>
 <cf2f5ee6-d0e2-fcfa-f2af-5ff722d3388c@mind.be>
 <CADYdroNJAbhAJb3=cghUYj1807k02PGs--nN258J8AKRsN4U8w@mail.gmail.com>
 <70c7ad00-5286-b254-fe7e-9d7e7d25eb70@mind.be>
 <CAB4xu_1N3NV_Z7cDYJ4DbKB=0476-axmCZUSaY4_CCA39T-i3A@mail.gmail.com>
 <20171106221202.2d23dac4@windsurf>
Message-ID: <CAB4xu_1vmUAHizhsKq2wFqpGVQYJoTwQ-QJ4PSExcU06_h9XHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 6, 2017 at 4:12 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 6 Nov 2017 16:06:10 -0500, Philippe Proulx wrote:
>
>> >
>> >>>  Since this is anyway just an example, wouldn't it be better to just disable the
>> >>> documentation entirely? I.e. teach configure.ac to understand --disable-doc and
>> >>> teach Makefile.am to not recurse into doc if docs are disabled?
>> >>
>> >> No problem with that, for the upstream package this might be more of an issue.
>> >
>> >  Philippe (one of the upstream developers) already said that he'd look into it.
>> >
>>
>> It's in master now, hope it helps:
>> <https://github.com/lttng/lttng-ust/commit/08aa9a26779d4ede3de7857fafd03bd6331ba948>.
>
> Thanks!
>
> While you're at it, do you think you could also have a look at
> http://autobuild.buildroot.net/results/f46/f46ba3cc8bf3ce979e9391db05780476cbba6ea0/build-end.log ?
> I reported it on the lttng mailing list a loooong time ago, and never
> got any feedback.
>
> It also happens with musl:
> http://autobuild.buildroot.net/results/99b/99bfee5ccd45c945bd607c3a8c0f972338133efc/build-end.log.

Yes, I know how to fix this. I'll have a look at it. We need to check
for dlmopen()'s support in configure.ac (like we do in LTTng-UST) and
conditionally build parts of the test depending on the result.

Phil

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
