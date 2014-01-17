From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 17 Jan 2014 09:51:34 +0800
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <20140116093642.GC4602@tarshish>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
 <20140116093642.GC4602@tarshish>
Message-ID: <52D88CA6.4010203@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thanks for taking a look at the patches.

>> +++ b/package/kexec-lite/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_KEXEC_LITE
>> +	bool "kexec-lite"
>> +	depends on BR2_powerpc
>> +	select BR2_PACKAGE_LIBELF
>> +	select BR2_PACKAGE_DTC
>> +	select BR2_PACKAGE_DTC_PROGRAMS
>> +	help
>> +	  Kexec is a user space utiltity for loading another kernel
>> +	  and asking the currently running kernel to do something with it.
> 
> This looks like a description of the generic kexec. You should mention that 
> this is a special version as the commit log says.

Yep, shamelessly stolen from kexec.mk. :) I've updated this with a
description similar to the changelog.

>> --- /dev/null
>> +++ b/package/kexec-lite/kexec-lite.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# kexec
>> +#
>> +################################################################################
>> +
>> +KEXEC_LITE_VERSION = 6c762a7
> 
> Full commit id.

Fixed, along with the other git version strings you've mentioned in this
series.

>> +KEXEC_LITE_SITE = git://github.com/antonblanchard/kexec-lite
> 
> Please use the github helper. See docs/manual/adding-packages-tips.txt.

Ah, that's pretty neat. Updated to use $(call github  ...).

I've updated my series with these changes, but will see if there's any
more feedback before reposting.

Cheers,


Jeremy
