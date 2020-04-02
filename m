From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 2 Apr 2020 21:38:42 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add openssh runtime
 test
In-Reply-To: <20200402141614.54c9d1b6@windsurf.home>
References: <20200330162411.9678-1-romain.naour@smile.fr>
 <20200331233206.632dcfce@windsurf.home>
 <cd51a10f-21ea-7395-91ec-093ae03f41d4@smile.fr>
 <20200402141614.54c9d1b6@windsurf.home>
Message-ID: <adbf598c-fea8-1176-53e2-ac9a85ef981c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 02/04/2020 ? 14:16, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Thu, 2 Apr 2020 13:48:15 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>>> Why use an x86-64 system? It forces you to build your own kernel? For
>>> this glibc configuration, you could build your own toolchain, but
>>> probably stick to using a prebuilt kernel.  
>>
>> I reused the configuration for Docker, that's why I used x86_64.
> 
> OK, but then you have to build your own kernel, which is no really
> needed.

Ok

> 
>> But the testsuite basically test only with uClibc-ng with an old toolchain by
>> default. It would be interesting to allow to select a custom toolchain.
> 
> You can already select whatever toolchain you want, since you provide
> for each test case the toolchain.

I mean, I would be interesting to override or provide another toolchain. For
example, a package test should be pass whatever the toolchain being used.

For the moment most of the tests are done with BASIC_TOOLCHAIN_CONFIG.

> 
> However, we could certainly update the default toolchain used in
> infra.basetest.BASIC_TOOLCHAIN_CONFIG

What about using br-arm-full-2020.02 ?

> 
>> Also, I noticed that the build continue even if the defconfig provided contain
>> an option that is dropped by make olddefconfig.
>>
>> For example, mesa3d:
>> https://git.buildroot.net/buildroot/commit/?id=faec5c583ec59e968fdb547aea93ab6ed001eb45
>>
>> The symbol BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST was missing since only one
>> swrast driver can be enabled.
>>
>> The test should stop is one of the provided symbol is missing (like
>> autobuild-run do).
> 
> Sure, that would make sense.
> 
>>>> +        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y  
>>>
>>> What about using the ARM ARM toolchain, and boot using the pre-built
>>> vexpress kernel ? This will significantly speed-up the build of the
>>> system for this runtime test.  
>>
>> Because I made this test to trigger the openssh issue with glibc 2.31 (local
>> patch applied to do the version bump).
> 
> Ah, OK, indeed.
> 
>> That's why It's important for the testsuite to allow testing with several
>> toolchain (I believe).
> 
> It already allows to do so: you did it!

See my explanation above.

Best regards,
Romain


> 
> Best regards,
> 
> Thomas
> 
