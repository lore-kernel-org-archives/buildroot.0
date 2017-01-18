From: Romain NAOUR <romain.naour@smile.fr>
Date: Wed, 18 Jan 2017 11:43:28 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_package/libcap=3A_fix_build_wit?=
 =?utf-8?q?h_gperf_=3E=3D_3=2E1?=
In-Reply-To: <87r340u0b8.fsf@dell.be.48ers.dk>
References: <20170117221723.10235-1-romain.naour@gmail.com>
 <87r340u0b8.fsf@dell.be.48ers.dk>
Message-ID: <aeece1d0a3287c8df1f4d538826706fd@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 2017-01-18 11:31, Peter Korsgaard a ?crit :

>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>> See gperf 3.1 ChangeLog:
>> * The 'len' parameter of the hash function and of the lookup function
> is now
>> of type 'size_t' instead of 'unsigned int'. This makes it safe to 
>> call
> these
>> functions with strings of length > 4 GB, on 64-bit machines.
> 
> :/
> 
> Have you submitted this patch upstream? Doesn't this then break 
> building
> against gperf <3.1?

Not yet. Indeed it break with gperf < 3.1 :-/
But I don't see how we can easily/properly handle the gperf version 
checking
in the libcap Makefile...

> 
> I think I'll apply Gustavoz patch to (temporarily) revert the gperf 
> bump
> instead. Once we have sorted out this libcap issue (and apparently 
> eudev
> as well) we can bump the version again.

Ok, it will give some time to Alvaro for investigation and test.

Best regards,
Romain
