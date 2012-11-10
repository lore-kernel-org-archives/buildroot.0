From: Chris Zankel <chris@zankel.net>
Date: Fri, 09 Nov 2012 16:28:05 -0800
Subject: [Buildroot] [PATCH 1/2] xtensa: add support for the Xtensa
	architecture
In-Reply-To: <509C1D94.2010107@mind.be>
References: <509b2947.a6e6440a.547c.7082@mx.google.com>
 <509C1D94.2010107@mind.be>
Message-ID: <509D9F95.1040806@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 11/08/2012 01:01 PM, Arnout Vandecappelle wrote:
> On 11/08/12 04:38, Chris Zankel wrote:
>>   config BR2_USE_MMU
>> -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh
>> +	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
>>   	default y if !BR2_bfin
>   So the Xtensa, a configurable processor, always has a MMU?
Good point. Actually, you can configure Xtensa with and without an MMU,
so I think the above logic is correct. It allows to configure MMU if the
processor is Xtensa, am I wrong?

Thanks,
-Chris
