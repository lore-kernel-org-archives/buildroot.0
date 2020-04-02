From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 2 Apr 2020 22:04:00 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add openssh runtime
 test
In-Reply-To: <20200402214133.3d5ba92c@windsurf.home>
References: <20200330162411.9678-1-romain.naour@smile.fr>
 <20200331233206.632dcfce@windsurf.home>
 <cd51a10f-21ea-7395-91ec-093ae03f41d4@smile.fr>
 <20200402141614.54c9d1b6@windsurf.home>
 <adbf598c-fea8-1176-53e2-ac9a85ef981c@smile.fr>
 <20200402214133.3d5ba92c@windsurf.home>
Message-ID: <7e3327f8-57d2-679f-1f7c-2cdfbfb5bf04@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/04/2020 ? 21:41, Thomas Petazzoni a ?crit?:
> On Thu, 2 Apr 2020 21:38:42 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>>>> But the testsuite basically test only with uClibc-ng with an old toolchain by
>>>> default. It would be interesting to allow to select a custom toolchain.  
>>>
>>> You can already select whatever toolchain you want, since you provide
>>> for each test case the toolchain.  
>>
>> I mean, I would be interesting to override or provide another toolchain. For
>> example, a package test should be pass whatever the toolchain being used.
> 
> How would you handle that? The point of runtime tests is that they
> should be reproducible so that we can track when they started failing.
> We also can't run all tests on all toolchains/architectures, that's not
> really realistic from a CPU time point of view, and from a test
> maintenance point of view.

My point is that we don't test with different gcc/binutils version and different
libc implementation. But we have to use the same architecture since the Qemu
command line is specific to the emulated architecture. If a test would be
available for several architecture it would require to update the qemu command
line (and the kernel configuration too).

At least testing with several gcc and libc implementation would be good enough?

> 
>>> However, we could certainly update the default toolchain used in
>>> infra.basetest.BASIC_TOOLCHAIN_CONFIG  
>>
>> What about using br-arm-full-2020.02 ?
> 
> Sure, would be good. Could you test this, do a Gitlab CI run, and see how it goes?

Ok.

Best regards,
Romain

> 
> Thomas
> 
