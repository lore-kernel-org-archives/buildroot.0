From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Jul 2015 14:15:57 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722132257.646b19cd@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com> <55AF6B19.7010702@openwide.fr>
 <20150722132257.646b19cd@free-electrons.com>
Message-ID: <55AF897D.5080803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 22/07/2015 13:22, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Wed, 22 Jul 2015 12:06:17 +0200, Romain Naour wrote:
> 
>>>>          arm |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/d81fe547227ffcbd270f2a00beb572755ab668f6/
>>>
>>> Discussed in http://patchwork.ozlabs.org/patch/473622/.
>>>
>>
>> Sorry, I haven't reworked on it after Peter's reply...
> 
> Ok. It'd be great to close that topic.

Sure.
> 
>>>
>>>>       x86_64 |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
>>>
>>> Another uClibc static linking problem. Waldemar?
>>>
>>
>> Waldemar, I think you can skip this issue since I'm working on the efl bump to
>> the latest release and I had to disable the efl package for uClibc-ng.
> 
> Actually the issue here is not libedje specific at all, it happens with
> several other packages when linking statically against uClibc-ng. So I
> believe it is still current.

Right, I haven't looked at the issue, my bad.
I wanted to say "skip efl related build failures" ;-)

> 
>> I had a link issue:
>> lib/eina/.libs/libeina.so: undefined reference to `mkstemps'
>> It turn out that mkstemps and mkostemps are not available in uClibc-ng.
> 
> And so you disabled it for uClibc-ng? I personally think it's a good
> idea for now. People really interested in EFL on uClibc can always work
> on fixing the remaining small issues.

Indeed, I also tried with a musl toolchain but the build stopped on pulseaudio
which is a mandatory dependency.

> 
>>>>       xtensa |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/a15c8b5cf90935e42d4605f7f95ff1814c94254c/
>>>>      powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f444ab04da5423db032bc12824da5f577156e957/
>>>>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/bf6b9bcc0cead87c8fb12ec4c7f5ff73e6d61d3f/
>>>>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/881f1e09ad3ba0c62f04349764446d4436a28781/
>>>
>>> Some should be fixed by http://patchwork.ozlabs.org/patch/495849/, but
>>> definitely not all of them. Samuel, since is package is CMake based,
>>> can you have a look?
>>
>> I've looked at it yesterday, and qpid-proton should be disabled for static only
>> build since it want to build unconditionally a shared library "libqpid-proton.so"
>>
>> Also host-swig dependency seems missing.
> 
> Will you send patches, or should I fix those issues directly?

Ok, I'll send patches.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
