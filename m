From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 13 Apr 2018 13:33:21 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <20180413131852.6df79113@windsurf>
References: <20180412151310.15252-1-eugene@largest.net>
 <20180413101341.52d0031e@windsurf>
 <CADYdroNbVjuEk-4e_=WDs30v6sm9ZTvOb2_DtJdA9XLKQXZRBQ@mail.gmail.com>
 <20180413131852.6df79113@windsurf>
Message-ID: <CADYdroOf7sVcvZ_jwm1cn3TfQHtib9U1xtCA16kdVEpXGr7Z9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-04-13 13:18 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Fri, 13 Apr 2018 11:32:52 +0200, Norbert Lange wrote:
>
>> There aren't any features of CMake used,
>> not for detecting libraries, not for detecting headers, not for getting flags,
>> all of this is missing compared to the Makefile. All that's there is a
>> subset of the fixed flags + logic from other buildsystems.
>> If that's an improvement for you, then there's not much left to discuss.
>>
>> Proper CMake support would need all that (at which point it is surely
>> better than make),
>> and I expect you will get alot of warnings now in builds, since some
>> feature detection macros are missing.
>
> I build tcf-agent 1.7.0, using the patch provided by Eugene, and it
> built without warnings.
>
>> I wont add proper CMake support myself (as I first considered it), as
>> I would have to dissect the information form other build-systems,
>> and keep it current every new version.
>
> Maybe we should just ask Eugene was is the official and
> upstream-supported build system for tcf-agent. Using CMake instead of
> hand-written Makefiles definitely makes a lot of sense. It does work
> today, and if there are some issues with it, they can be fixed.

Please separate what CMake could do, and what it does in the concrete example,
especially in the state it is right NOW.
I already raised this in the Bugzilla, and I cant speak for upstream,
but my understanding is that improvements wont originate from upstream.

>
> Look at your patch that was fixing the static linking issue with
> OpenSSL. CMake has built-in support for detecting libraries using
> pkg-config, automatically solving such static linking issues.

I am pretty sure the failure I had with the Makefile is there too.
Cant test this today,
but I can tell you that I did not change *from* CMake (which I
otherwise try to use everywhere)
without reason.

Use CMake as soon as its properly supported, but not when its the
worse choice right now.

Norbert
