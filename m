From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Nov 2015 10:51:08 -0300
Subject: [Buildroot] [PATCH] gmp: disable for MIPS R6
In-Reply-To: <20151124144126.4d6ad588@free-electrons.com>
References: <1448368861-24776-1-git-send-email-Vincent.Riera@imgtec.com>
 <56545FE6.7060405@zacarias.com.ar>
 <20151124144126.4d6ad588@free-electrons.com>
Message-ID: <56546B4C.1040105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/11/15 10:41, Thomas Petazzoni wrote:

>> Hi.
>> How about in package/gmp.mk:
>>
>> ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
>> GMP_CONF_OPTS += --disable-assembly
>> endif
>
> If this works, sounds a *lot* better than duplicating the !mipsr6
> dependency to zillions of packages.
>
> Vicente ?
>
> Thomas

Hi.
Already sent a patch and build-tested for both 32r6 & 64r6.
That codepath is used for architectures that don't have 
assembly-optimized routines, so it's pretty safe. Slower of course, but 
better than nothing.
Regards.
