From: Jan Heylen <heyleke@gmail.com>
Date: Fri, 22 Dec 2017 16:20:46 +0100
Subject: [Buildroot] [PATCH] Opentracing: add opentracing-cpp v1.2.0
 package
In-Reply-To: <CAHXCMMJgbSncPfSNvxd9M=qb7B8NXi2rM1Rce8wpgQMT1COcFg@mail.gmail.com>
References: <1513849309-550-1-git-send-email-heyleke@gmail.com>
 <1513849309-550-2-git-send-email-heyleke@gmail.com>
 <CAHXCMMJgbSncPfSNvxd9M=qb7B8NXi2rM1Rce8wpgQMT1COcFg@mail.gmail.com>
Message-ID: <CAGszK3gr8t6ke1aoGFm1S2ZF-Lt=3vNw0qN4fam90FF4NBD4ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Samuel,

thx for the quick feedback, I'll have a look and come back with a V2,

br,

Jan

On Fri, Dec 22, 2017 at 4:00 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>  Hi Jan,
>
> Thanks for this contribution.
>
> On Thu, Dec 21, 2017 at 10:41 AM,  <heyleke@gmail.com> wrote:
>> From: Jan Heylen <jan.heylen@nokia.com>
>>
>> ---
>>  package/Config.in                            |  1 +
>>  package/opentracing-cpp/Config.in            | 11 +++++++++++
>>  package/opentracing-cpp/opentracing-cpp.hash |  2 ++
>>  package/opentracing-cpp/opentracing-cpp.mk   | 15 +++++++++++++++
>>  4 files changed, 29 insertions(+)
>>  create mode 100644 package/opentracing-cpp/Config.in
>>  create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
>>  create mode 100644 package/opentracing-cpp/opentracing-cpp.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index bd39a37..044a7e8 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1288,6 +1288,7 @@ menu "Logging"
>>         source "package/log4cplus/Config.in"
>>         source "package/log4cpp/Config.in"
>>         source "package/log4cxx/Config.in"
>> +    source "package/opentracing-cpp/Config.in"
>
> Here it should be indented with 1 tab instead of 4 spaces.
>
>>         source "package/zlog/Config.in"
>>  endmenu
>>
>> diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
>> new file mode 100644
>> index 0000000..3f6f1ad
>> --- /dev/null
>> +++ b/package/opentracing-cpp/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_OPENTRACING_CPP
>> +       bool "opentracing-cpp"
>> +       depends on BR2_INSTALL_LIBSTDCPP
>> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>> +       help
>> +         OpenTracing API for C++
>> +
>> +         http://opentracing.io
>> +
>> +comment "opentracing-cpp needs a toolchain w/ C++"
>> +       depends on !BR2_INSTALL_LIBSTDCPP
>> diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
>> new file mode 100644
>> index 0000000..a710d62
>> --- /dev/null
>> +++ b/package/opentracing-cpp/opentracing-cpp.hash
>> @@ -0,0 +1,2 @@
>> +# Locally calculated
>> +sha256 c77041cb2f147ac81b2b0702abfced5565a9cebc318d045c060a4c3e074009ee opentracing-cpp-v1.2.0.tar.gz
>
> Could you add the hash of the license files as well, please?
>
>> diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
>> new file mode 100644
>> index 0000000..e090be5
>> --- /dev/null
>> +++ b/package/opentracing-cpp/opentracing-cpp.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# opentracing-cpp
>> +#
>> +################################################################################
>> +
>> +OPENTRACING_CPP_VERSION = v1.2.0
>> +OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,$(OPENTRACING_CPP_VERSION))
>> +OPENTRACING_CPP_LICENSE = MIT
>> +OPENTRACING_CPP_LICENSE_FILES = COPYING
>> +
>> +OPENTRACING_CPP_INSTALL_STAGING = YES
>> +OPENTRACING_CPP_INSTALL_TARGET = YES
>
> *_INSTALL_TARGET default is YES, so this line is unnecessary.
>
> Looking at the opentracing-cpp CMakeLists.txt, it seems both shared
> and static libraries are built and installed.
> Maybe, this should be cleaned up for proper static-only (or shared
> only) support.
>
>> +
>> +$(eval $(cmake-package))
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>
> --
> Samuel
