From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Dec 2015 12:31:08 +0000
Subject: [Buildroot] [PATCH 2/3] qemu: wrap lines to 72 characters length
In-Reply-To: <20151217130858.058c2c65@free-electrons.com>
References: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
 <1450353428-57815-2-git-send-email-Vincent.Riera@imgtec.com>
 <20151217130858.058c2c65@free-electrons.com>
Message-ID: <5672AB0C.7050806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/15 12:08, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> I'm with the commit, with one exception.
> 
> On Thu, 17 Dec 2015 11:57:07 +0000, Vicente Olivert Riera wrote:
> 
>> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
>> index c5c3f05..e9b944b 100644
>> --- a/package/qemu/Config.in.host
>> +++ b/package/qemu/Config.in.host
>> @@ -3,15 +3,16 @@ config BR2_PACKAGE_HOST_QEMU
>>  	# So far, we only build the user mode emulation, so this list
>>  	# of architecture dependencies only takes into account this
>>  	# emulation mode.
>> -	depends on BR2_arm       || BR2_armeb       || BR2_aarch64      || \
>> -		BR2_i386         || BR2_m68k        || BR2_microblazeel || \
>> -		BR2_microblazebe || BR2_mips        || BR2_mipsel       || \
>> -		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
>> -		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
>> -		BR2_sparc        || BR2_x86_64
>> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || \
>> +		BR2_m68k || BR2_microblazeel || BR2_microblazebe || \
>> +		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
>> +		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
>> +		BR2_sh || BR2_sparc || BR2_x86_64
> 
> Why are you doing this? The original version is much more readable.

Ok, no problem. You can apply the patch with that part removed. Or do
you prefer a v2?

Regards,

Vincent.

> Thomas
> 
