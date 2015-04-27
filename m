From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 27 Apr 2015 08:50:43 +0100
Subject: [Buildroot] [PATCH 2/2] QEMU: Enable package for MIPS targets
In-Reply-To: <20150425101806.382e8c2b@free-electrons.com>
References: <1429782657-6283-1-git-send-email-markos.chandras@imgtec.com>	<1429782657-6283-2-git-send-email-markos.chandras@imgtec.com>
 <20150425101806.382e8c2b@free-electrons.com>
Message-ID: <553DEA53.7070803@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/25/2015 09:18 AM, Thomas Petazzoni wrote:
> Dear Markos Chandras,
> 
> On Thu, 23 Apr 2015 10:50:57 +0100, Markos Chandras wrote:
> 
>> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
>> index fff786d3f11f..f537ce67181c 100644
>> --- a/package/qemu/Config.in
>> +++ b/package/qemu/Config.in
>> @@ -1,11 +1,16 @@
>> +config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>> +	bool
>> +	# Only tested in these architectures
>> +	default y if BR2_i386 || BR2_mips || BR2_mipsel || BR2_x86_64
> 
> So not on mips64/mips64el...

No because it does not seem to (cross-)build for mips64.

> 
>> -#       mips64          ?
>> -#       mips64el        ?
>> +#       mips64          mips64
>> +#       mips64el        mips64el
> 
> but you update the mips64* information, which would probably indicate
> that it works, no?

I was not sure what that list is for. I just added the missing targets
there. You can still get a mips64(el) targets on a mips host though.

> 
> Anyway, I've applied the patch as is, feel free to send a follow-up
> patch adding mips64* as well if that works.

Yes we will eventually fix the build problems upstream. Thanks!

-- 
markos
