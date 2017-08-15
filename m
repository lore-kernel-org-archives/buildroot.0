From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 15 Aug 2017 09:15:05 -0500
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <20170815155931.1ed43ffd@windsurf>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <CANQCQpbHChJOk0=8Mo0U==BRdYRL9=W9kwxkJFZAK=bCXx944A@mail.gmail.com>
 <20170815155931.1ed43ffd@windsurf>
Message-ID: <CANQCQpaSi0JaqU9StpRGTD74F0SCRcS+RnmG=Jygyv=NU0na=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Aug 15, 2017 at 8:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 15 Aug 2017 07:58:43 -0500, Matthew Weber wrote:
>
>> > All of these are qemu-user failures, due to the host kernel headers
>> > being too old. This error is normally ignored by autobuild-run, but
>> > Julien's autobuilder is running a too old version of autobuild-run. So
>> > I've temporarily added some filtering on the server side to reject such
>> > bogus failures.
>>
>> You're going to see some more unknown builds today (end log snippets
>> below).  I've updated my autobuilder and trying to figure out the
>> following new error.  At this point I disabled my result submissions
>> and doing further testing offline.
>>
>> http://autobuild.buildroot.net/results/e19/e196ceb333f554748081e78858eafb2739e0e317//
>>  [7m>>>   Sanitizing RPATH in target tree [27m
>> /accts/mlweber1/instance-3/buildroot/support/scripts/fix-rpath target
>> make: Leaving directory `/accts/mlweber1/instance-3/buildroot'
>> make: Entering directory `/accts/mlweber1/instance-3/buildroot'
>> package/coxpcall/coxpcall.mk:11: *** COXPCALL_SITE cannot be empty
>> when COXPCALL_SOURCE is not.  Stop.
>> make: Leaving directory `/accts/mlweber1/instance-3/buildroot'
>>
>>
>> http://autobuild.buildroot.net/results/d3f/d3fa24b5589cc75f040a8f7aedb442ffda9b6814//
>>  [7m>>>   Sanitizing RPATH in target tree [27m
>> /accts/mlweber1/instance-2/buildroot/support/scripts/fix-rpath target
>> make: Leaving directory `/accts/mlweber1/instance-2/buildroot'
>> make: Entering directory `/accts/mlweber1/instance-2/buildroot'
>> package/lua-bit32/lua-bit32.mk:13: *** LUA_BIT32_SITE cannot be empty
>> when LUA_BIT32_SOURCE is not.  Stop.
>> make: Leaving directory `/accts/mlweber1/instance-2/buildroot'
>>
>> Has anyone else seen errors like these?
>>
>> The only modifications I have to the autobuilder script are to use a
>> local cache of archives for my BR2_PRIMARY_SITE.  ( we refresh it
>> daily out-of-band for internal firewall/proxy download failure
>> reasons)   As part of setting BR2_PRIMARY_SITE  we set
>> BR2_PRIMARY_SITE_ONLY=y.
>
> Having BR2_PRIMARY_SITE_ONLY=y is going to trigger some download
> errors, when your mirror will not contain a tarball that is needed.
> Please don't enable BR2_PRIMARY_SITE_ONLY=y if you contribute to the
> public autobuild.b.o.
>
> However, I indeed spotted this "unknown" error on coxpcall from your
> machine, and wasn't able to reproduce it. Can you investigate what's
> going on ?

Sure

>
> In the mean time, I would ask you to stop using this BR2_PRIMARY_SITE +
> BR2_PRIMARY_SITE_ONLY setup. We don't want to be flooded with "unknown"
> errors at this time, especially now that we understand those will
> happens for pretty much all luarocks packages in your scenario.

Yeah, I'm just going to let it run offline for now.

Matt
