From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 27 Apr 2021 10:05:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <ad394a6c-1ec6-0659-51b6-c7704110c71a@mind.be>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
 <20210426194329.GL298901@scaer>
 <ad394a6c-1ec6-0659-51b6-c7704110c71a@mind.be>
Message-ID: <6372bec9-db43-6dbf-4b93-706b399bd072@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le 27/04/2021 ? 09:25, Arnout Vandecappelle a ?crit?:
> 
> 
> On 26/04/2021 21:43, Yann E. MORIN wrote:
>> Arnout, Romain, All,
>>
>> On 2021-04-26 21:36 +0200, Arnout Vandecappelle spake thusly:
>>> On 26/04/2021 12:10, Romain Naour wrote:
>>> [snip]
>>>>  rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
>>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
>>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>>>>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)
>>>
>>>  Now you're messing with these packages, maybe you can take the opportunity to
>>> get rid of the versioned subdirectory. That's a leftover from when we had
>>> version selection for glibc.
>>
>> We stil have a version choice for glibc; it's just not exposed to the
>> user: indeed we use different version for csky, riscv32, and the rest.
>>
>> So, we still do not want to apply the "generic" patches to the csky
>> fork, or to the riscv32 version...
> 
>  Ah, I missed the csky fork... The riscv32 one should be gone, so I thought that
> was it.

The csky for is based on glibc 2.28 but csky was added to glibc 2.29

https://sourceware.org/git/?p=glibc.git;a=commit;h=5f72b00591ce4d1b4c0418294ffe1623983d5679

Maybe we can use upstream glibc?
But we can't test with our Qemu version since csky is not yet upstream, we can
retrieve the csky qemu fork we had last year.

Guo, can you have a look?

> 
>  Regardless, for localedef, we don't have a version choice so we don't need the
> subdirectory there.

We may need a version choice for localedef depending on glibc version of
external toolchains because localedef update can introduce some incompatibilities.

https://git.buildroot.net/buildroot/commit/?id=0ec7169e6c8cfb4bb54defb685bd04bb1da0a2aa

See also Thomas's concern:
http://lists.busybox.net/pipermail/buildroot/2020-July/287502.html

But this is still to implement.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
>>
>> Regards,
>> Yann E. MORIN.
>>
