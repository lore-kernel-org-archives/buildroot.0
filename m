From: Chris Zankel <chris@zankel.net>
Date: Fri, 09 Nov 2012 16:50:21 -0800
Subject: [Buildroot] [PATCH 1/2 v3] xtensa: add support for the Xtensa
 architecture
In-Reply-To: <509DA1F4.7010009@mind.be>
References: <509d9da3.e2d5440a.1892.015f@mx.google.com>
 <509DA1F4.7010009@mind.be>
Message-ID: <509DA4CD.5000904@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Arnout,

On 11/09/2012 04:38 PM, Arnout Vandecappelle wrote:
> On 11/10/12 01:19, Chris Zankel wrote:
>> diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
>> index c304572..3622f3d 100644
>> --- a/package/autoconf/Config.in
>> +++ b/package/autoconf/Config.in
>> @@ -1,6 +1,7 @@
>>   config BR2_PACKAGE_AUTOCONF
>>   	bool "autoconf"
>> -	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
>> +	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3)
>> +	depends on !(BR2_sh3eb || BR2_sh64 || BR2_xtensa)
>>   	select BR2_PACKAGE_PERL
>>   	help
>>   	  Extensible program for developing configure scripts.  These
>   Actually, these dependencies can be removed again, because perl no longer
> depends on host-qemu. I'll post a patch removing them.
So, I guess that breaks my patch ;-)

>   And anyway, host-qemu exists for xtensa, no?
Yes, there is a version of Qemu that was done my Max, but it might
require a different processor configuration than what's in the toolchain
by default.

-Chris
