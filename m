From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Aug 2017 16:44:22 +0200
Subject: [Buildroot] WIP: glibc 2.16 bump
In-Reply-To: <20170814162421.4228d9c1@windsurf>
References: <a24db610-bef2-c2fc-c9af-ba23cf29cc25@gmail.com>
 <20170812134641.7895db19@windsurf>
 <6125d920-9dd6-71b5-bb88-c4daa9d7c51b@gmail.com>
 <50207c65-6029-298c-6b69-f5937a107487@gmail.com>
 <20170814162421.4228d9c1@windsurf>
Message-ID: <5ae08012-0fc1-6a78-5952-cc7081afafe7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 14/08/2017 ? 16:24, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Mon, 14 Aug 2017 15:04:10 +0200, Romain Naour wrote:
> 
>>> Can you try with this branch ?
>>> https://github.com/RomainNaour/buildroot/tree/glibc-2.26  
>>
>> I started a build on gcc farm and the only failing build is powerpc64le.
>>
>> I added this hunk in gcc.mk
>>
>> # Since Glibc 2.26, poerpc64le requires double/long double.
>> # See sysdeps/powerpc/powerpc64le/configure.ac
>> ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_powerpc64le),yy)
>> HOST_GCC_COMMON_CONF_OPTS += \
>> 	--with-long-double-128
>> endif
>>
>> I updated glibc-2.26 branch on github.
>>
>> Note: float128 require at least gcc 6.2 or gcc 7.1, so we need to disable older
>> gcc on powerpc64le with glibc.
> 
> OK. I'm about to start a rebuild of all my toolchains + Qemu tests with
> glibc 2.26 (and gcc 7.x, binutils 2.29, etc, i.e the bleeding edge
> toolchains).
> 
> FYI: the two gcc patches that you needed to build glibc 2.26 are no
> longer needed once you bump gcc to 7.2.0, which I have done for this
> toolchain rebuild. I'll send the gcc 7.2.0 bump patch once all
> toolchains have been rebuilt.
> 
> I'll let you know the result.

Ok perfect :)

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
