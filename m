From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 05 Apr 2014 10:14:52 +0200
Subject: [Buildroot] [PATCH v3 1/1] manual/configure.txt: fix typo
In-Reply-To: <533E4A29.2070009@mind.be>
References: <1396560067-14091-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <533E4A29.2070009@mind.be>
Message-ID: <533FBB7C.1020409@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Arnout,

Thanks for the feedback.

> On 03/04/14 23:21, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>   Could you add to the commit log _why_ this is a typo? You're removing a
> backslash in one place and adding it in another place, so it is not at
> all obvious why this is the correct thing to do. In fact, it's not a
> typo, it's a formatting error.

There is an extra backslash in the latest stable release buildroot 2014.02
documentation (html and pdf); have a look at:
http://buildroot.uclibc.org/downloads/manual/manual.html#_cross_compilation_toolchain
manual/configure.txt (buildroot 2014.02)
"...
   whether your toolchain supports C\+\+ or not and whether it has
..."

I posted a patch to remove this backslash (C\+\+ --> C\++), but in the 
meantime after
my discussion with Thomas P. (I suppose Thomas misunderstood me) he made
commit 082dec8ce440236b1477e568f0965f05ad241adb

So:
my patch v3 = 'revert commit of Thomas' + 'my patch v2'
commit of Thomas:
commit 082dec8ce440236b1477e568f0965f05ad241adb
my patch v2:
http://lists.busybox.net/pipermail/buildroot/2014-March/093207.html

Regards,
Jerzy

>
>   Regards,
>   Arnout
>
>> ---
>> v3:
>>   - rebase on top of the master
>> v2:
>>   - remove only one backslash
>>
>>   docs/manual/configure.txt |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
>> index c1c9477..ee5e65e 100644
>> --- a/docs/manual/configure.txt
>> +++ b/docs/manual/configure.txt
>> @@ -100,7 +100,7 @@ most important ones allow to:
>>      toolchain should have largefile support (i.e. support for files
>>      larger than 2 GB on 32 bits systems), IPv6 support, RPC support
>>      (used mainly for NFS), wide-char support, locale support (for
>> -   internationalization), C\++ support or thread support. Depending on
>> +   internationalization), C++ support or thread support. Depending on
>>      which options you choose, the number of userspace applications and
>>      libraries visible in Buildroot menus will change: many applications
>>      and libraries require certain toolchain options to be enabled. Most
>> @@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
>>     prefix+ and +External toolchain C library+ options. Then, you have
>>     to tell Buildroot what your external toolchain supports. If your
>>     external toolchain uses the 'glibc' library, you only have to tell
>> -  whether your toolchain supports C++ or not and whether it has
>> +  whether your toolchain supports C\++ or not and whether it has
>>     built-in RPC support. If your external toolchain uses the 'uClibc'
>>     library, then you have to tell Buildroot if it supports largefile,
>>     IPv6, RPC, wide-char, locale, program invocation, threads and
>>
>
