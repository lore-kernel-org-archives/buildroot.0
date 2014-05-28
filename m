From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 May 2014 18:15:31 +0200
Subject: [Buildroot] [PATCH] audiofile: does not build with static-only
In-Reply-To: <538259D0.4090008@lucaceresoli.net>
References: <1400941494-29900-1-git-send-email-luca@lucaceresoli.net>
 <20140524184541.47d3f8f9@free-electrons.com>
 <5381278F.9040209@zacarias.com.ar> <538259D0.4090008@lucaceresoli.net>
Message-ID: <53860BA3.6080605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[I hope my FIFO reading is not going to cause me to make more duplicate comments..]

On 25/05/14 23:00, Luca Ceresoli wrote:
> Hi Gustavo, Thomas,
> 
> Gustavo Zacarias wrote:
>> On 05/24/2014 01:45 PM, Thomas Petazzoni wrote:
>>
>>> No, I disagree. The real problem is the fact that we pass --static
>>> instead of -static when building statically, so libtool turns -lstdc++
>>> into a full path to libstdc++.so instead of libstdc++.a.
>>>
>>> The real fix is to understand why we switched from -static to --static
>>> a few years ago: there is a commit from Andy Kennedy making this
>>> change, but the commit log is quite fuzzy about why this is actually
>>> needed.
>>
>> Hi.
>> As we discussed with Thomas on IRC i've been digging and testing a bit
>> and promised to write about my assorted notes for the static dilemma:
> 
> Ah, I see, I hadn't followed that discussion and was not aware of such
> work you're doing. Sorry for the noise and thanks for the detailed
> clarification.

 Yeah, much better clarification than what I said this morning :-)

> 
> I understand the solution won't land in 2014.05.
> I wonder what's the best thing to do in cases like this to make users
> aware what there's a known bug in a release.
> 
> Should audiofile depend on BROKEN if BR2_PREFER_STATIC_LIB? This way it
> would disappear from both the user's sight and the autobuilders, but
> still visible via menuconfig search.
> 
> Or should we just add a comment that depends on audiofile and
> BR2_PREFER_STATIC_LIB?

 I think it's better if we start having release notes for these kinds of known
issues. This could actually be part of the CHANGES file, but then we should make
a habit of including updates to the CHANGES file when submitting patches. Or it
could be part of the documentation. Or of course a separate ReleaseNotes file.
For sure, it must be something that is easily googlable.

 Deprecated .config symbols (i.e. the legacy stuff) should also be in these
release notes.


 Regards,
 Arnout

> 
> I think the former (o the sum of the two) is preferred. It would stop
> polluting the autobuilders with known bugs and track the issue via
> `git grep BROKEN`.
> 
> Helping in fixing this bug is out of reach for me, but I can at least
> send a patch for BROKEN if it's the proper way to go.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
