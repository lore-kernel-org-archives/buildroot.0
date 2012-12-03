From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Dec 2012 13:48:48 -0300
Subject: [Buildroot] [PATCH 14/14] ltrace: bump to version 0.7.1
In-Reply-To: <20121203174545.475969fe@skate>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
 <1354545972-26783-14-git-send-email-gustavo@zacarias.com.ar>
 <20121203174545.475969fe@skate>
Message-ID: <50BCD7F0.7070807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2012 01:45 PM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Mon,  3 Dec 2012 11:46:12 -0300, Gustavo Zacarias wrote:
> 
>>  config BR2_PACKAGE_LTRACE
>>  	bool "ltrace"
>> -	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64)
>> -	depends on !BR2_xtensa
>> +	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa)
>>  	select BR2_PACKAGE_LIBELF
> 
> So now ltrace supports mipsel ?

Oh yes, qemu mipsel tested.

> When there are more changes than just bumping the version name, like
> changes in patches and other things, it'd be nice to have a slightly
> more elaborate commit log.

Yes, i could be more verbose, noted.

> And, unrelated to the commit itself, did you try this ltrace version? I
> have never been able to get ltrace 0.6 to work on ARM/uClibc.

I didn't run test it on ARM, just mipsel to really verify it and ppc to
see that it wasn't broken (and it was, hence the new ppc patch).
I'll fire up a arm qemu build to test it.
Regards.
