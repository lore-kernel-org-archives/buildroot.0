From: Lionel Orry <lionel.orry@gmail.com>
Date: Tue, 8 Apr 2014 09:32:53 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.1
In-Reply-To: <CAAXf6LVOm34-2gHVMbiEp85otVQa7PVuzqsFbNCGOB0upKAAQA@mail.gmail.com>
References: <1381509097-5424-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140301232520.4ee4b22b@skate>
 <CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>
 <20140303084702.7790637d@skate>
 <CAKAx1chY=kd3Y_N2-HRqmtELox8gSA9+hVUmaEAT4BNv_mXb9g@mail.gmail.com>
 <20140303111124.1126480c@skate>
 <CAAXf6LVOm34-2gHVMbiEp85otVQa7PVuzqsFbNCGOB0upKAAQA@mail.gmail.com>
Message-ID: <CAKAx1ch=rxf=EfCfntHxqfsV4jQEU1asj9JTQ4odMhrD2xZJEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Apr 7, 2014 at 4:32 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Jerzy, Lionel,
>
> On Mon, Mar 3, 2014 at 11:11 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Lionel Orry,
>>
>> On Mon, 3 Mar 2014 09:14:44 +0100, Lionel Orry wrote:
>>
>>> > What do you mean by "such a patch" ? Maybe you forgot to attach a patch
>>> > to your e-mail?
>>>
>>> um no, I meant the "appropriate patch" you were suggesting Jerzy to
>>> prepare so that mongrel2 compiles. If I understood correctly.
>>
>> Ah ok.
>>
>>> > Does ZeroMQ v4 changes the API/behavior a lot compared to v3 ?
>>>
>>> The v2 -> v3 transistion has been a nightmare more many devs, but they
>>> learnt from it and it seems the v3->v4 is much smoother.
>>>
>>> By the way, I noticed the mongrel2 devs tagged a v1.9.0 a month ago,
>>> and this release includes a zeromq4 compliance, plus other fixes and
>>> enhancements. May I suggest we simply bump the mongrel2 version ?
>>
>> Indeed, seems like the best solution.
>>
>> Jerzy, can you have a look into this?
>
> Any of you interested in reviving this patch, bumping mongrel2 at the same time?

Quick news : mongrel v1.9.0 depends on polarssl now. But they decided
to declare this dependency as a git submodule of their repo, and the
release tarball being taken directly from github does not include the
polarssl code. In short, they release tarball is unuseable. I'll talk
about it upstream.

To make it clean, I'll try to get rid of the git submodule dep and
make attempts with the polarssl buildroot package.

The bad (or not?) news is that mongrel2 depends on polarssl v1.3.0
(v1.3.x if polarssl properly versions its library, I think it is the
case) and we currently use polarssl v1.2.10, so a polarssl bump
version is needed first.

Does anyone know what implications could a polarssl minor version bump
have ? I already saw some of the polarssl patches don't apply properly
so they need to be revisited. Gustavo, I think you were in charge of
the last polarssl bump, do you think you could help with this one, or
say whether it is a very bad idea to bump the package version ?

Thanks everyone,
Lionel

>
> Thanks,
> Thomas
