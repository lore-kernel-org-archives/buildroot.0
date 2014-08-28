From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Thu, 28 Aug 2014 12:04:55 +0200
Subject: [Buildroot] [PATCH 2/4] avrdude: Depend on elfutils instead of
 libelf to get the libel library
In-Reply-To: <20140828100214.GC4042@free.fr>
References: <1409219230-17443-1-git-send-email-gregory.clement@free-electrons.com>
 <1409219230-17443-3-git-send-email-gregory.clement@free-electrons.com>
 <20140828100214.GC4042@free.fr>
Message-ID: <53FEFEC7.5060001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 28/08/2014 12:02, Yann E. MORIN wrote:
> Gregory, All,
> 
> On 2014-08-28 11:47 +0200, Gregory CLEMENT spake thusly:
>> The elfutils package provides a more recent version of the libelf, so
>> let's use it. It will allow to remove the libelf package and to avoid
>> conflicts with two packages providing the same library.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> 
> Slight typo in subject:  "the libel library"  <- libelf
> 
>> ---
>>  package/avrdude/Config.in  | 2 +-
>>  package/avrdude/avrdude.mk | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
>> index 8eac014..5de8301 100644
>> --- a/package/avrdude/Config.in
>> +++ b/package/avrdude/Config.in
>> @@ -1,6 +1,6 @@
>>  config BR2_PACKAGE_AVRDUDE
>>  	bool "avrdude"
>> -	select BR2_PACKAGE_LIBELF
>> +	select BR2_PACKAGE_ELFUTILS
> 
> You need to propagate the dependencies from elfutils too, because
> 'select' does not propagate them, see chapter "Choosing depends on or
> select" in the manual:
>     http://buildroot.net/downloads/manual/manual.html#_literal_config_in_literal_file

Oh yes indeed I saw it for ltrace. I will send a new patch set soon by
updating this patch the kexec-lite patch too.

Thanks,

Gregory


> 
> Regards,
> Yann E. MORIN.
> 
>>  	select BR2_PACKAGE_LIBUSB
>>  	select BR2_PACKAGE_LIBUSB_COMPAT
>>  	select BR2_PACKAGE_NCURSES
>> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
>> index 7876c1d..03d6490 100644
>> --- a/package/avrdude/avrdude.mk
>> +++ b/package/avrdude/avrdude.mk
>> @@ -12,7 +12,7 @@ AVRDUDE_SUBDIR = avrdude
>>  # Sources coming from git, without generated configure and Makefile.in
>>  # files.
>>  AVRDUDE_AUTORECONF = YES
>> -AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses \
>> +AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>>  	host-flex host-bison
>>  AVRDUDE_LICENSE = GPLv2+
>>  AVRDUDE_LICENSE_FILES = avrdude/COPYING
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
