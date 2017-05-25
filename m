From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 May 2017 19:52:55 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add support for gcc 7
In-Reply-To: <20170524162612.09a18a25@free-electrons.com>
References: <20170523202440.6949-1-romain.naour@gmail.com>
 <20170523202440.6949-2-romain.naour@gmail.com>
 <20170524162612.09a18a25@free-electrons.com>
Message-ID: <308e9ace-7a1c-637c-10ae-bc2e5d292456@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/05/2017 ? 16:26, Thomas Petazzoni a ?crit :
> Hello,
> 
> First of all, thanks for doing this work!
> 
> I've added Alexey, Waldemar and Vicente in Cc, since there are some
> ARC, Microblaze, OpenRISC and MIPS questions below.
> 
> On Tue, 23 May 2017 22:24:39 +0200, Romain Naour wrote:
>> Remove upstream patches:
> 
> [...]
> 
> Nice to see that so many patches are upstream, and that our stack of
> gcc patches for 7.x is now really small!

Indeed :)

> 
> Perhaps we should start some effort to upstream the last few remaining
> patches?

I can add this in our TODO list for the next Buildroot summer camp or next meeting.

> 
>> +config BR2_GCC_VERSION_7_X
>> +	bool "gcc 7.x"
>> +	# Broken or unsupported architectures
>> +	depends on !BR2_arc
>> +	depends on !BR2_microblaze
>> +	depends on !BR2_or1k
> 
> ARC is indeed still not supported fully in gcc 7.x I believe. Alexey,
> do you confirm?
> 
> But what is the problem with Microblaze? And with OpenRISC? Waldemar?
> 
> OpenRISC has its own gcc version, so I guess that's the answer. But
> what about Microblaze?

I haven't checked the status of all broken or unsupported architectures when
bumping to gcc 7. I wanted to keep the same dependency as gcc 6 for the moment.

> 
>> +	# Unsupported MIPS cores
>> +	depends on !BR2_mips_m6250 && !BR2_mips_p6600
> 
> Vicente, what is the status of the support for those MIPS cores in gcc
> 7.x ?
> 
> Romain: I think we should also default to gcc 6.x now instead of
> defaulting to gcc 5.x.
> 
> And perhaps we should start thinking about removing gcc 4.9.x as well.
> For toolchain components, I don't think it makes sense to support more
> than three versions, i.e:
> 
>  1. old one (would be 5.x now)
>  2. default one (would be 6.x now)
>  3. bleeding edge one (would be 7.x now)

Ok :)

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
