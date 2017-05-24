From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 24 May 2017 16:37:10 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add support for gcc 7
In-Reply-To: <20170524162612.09a18a25@free-electrons.com>
References: <20170523202440.6949-1-romain.naour@gmail.com>
 <20170523202440.6949-2-romain.naour@gmail.com>
 <20170524162612.09a18a25@free-electrons.com>
Message-ID: <577DC15D-90CA-49B8-BFC9-10982D4E978A@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 24.05.2017 um 16:26 schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> 
> Hello,
> 
> First of all, thanks for doing this work!
> 
> I've added Alexey, Waldemar and Vicente in Cc, since there are some
> ARC, Microblaze, OpenRISC and MIPS questions below.
> 
>> On Tue, 23 May 2017 22:24:39 +0200, Romain Naour wrote:
>> Remove upstream patches:
> 
> [...]
> 
> Nice to see that so many patches are upstream, and that our stack of
> gcc patches for 7.x is now really small!
> 
> Perhaps we should start some effort to upstream the last few remaining
> patches?
> 
>> +config BR2_GCC_VERSION_7_X
>> +    bool "gcc 7.x"
>> +    # Broken or unsupported architectures
>> +    depends on !BR2_arc
>> +    depends on !BR2_microblaze
>> +    depends on !BR2_or1k
> 
> ARC is indeed still not supported fully in gcc 7.x I believe. Alexey,
> do you confirm?
> 
> But what is the problem with Microblaze? And with OpenRISC? Waldemar?
> 
> OpenRISC has its own gcc version, so I guess that's the answer. But
> what about Microblaze?

There is a regression between gcc 5.x and 6.x for microblaze, which still prevents to bootup any system in qemu. (uclibc-ng, musl, glibc)
Problem is still present in gcc 7.

Does anyone have time to bisect it?

best regards
 Waldemar 
