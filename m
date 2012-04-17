From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 17 Apr 2012 15:35:26 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
References: <1334668612-8220-1-git-send-email-bachmann@tofwerk.com>
 <4F8D6F39.2080705@free-electrons.com>
Message-ID: <op.wcwv1cq6705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 17.04.2012, 15:25 Uhr, schrieb Maxime Ripard  
<maxime.ripard@free-electrons.com>:

> Hi,
>
> Le 17/04/2012 15:16, Rico Bachmann a ?crit :
>> Signed-off-by: Rico Bachmann  
>> <bachmann@tofwerk.com>
>> ---
>>  package/Config.in     |    1 +
>>  package/apr/Config.in |    7 +++++++
>>  package/apr/apr.mk    |   18 ++++++++++++++++++
>>  3 files changed, 26 insertions(+), 0 deletions(-)
>>  create mode 100644 package/apr/Config.in
>>  create mode 100644 package/apr/apr.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 4c6d4d8..ceb5f6d 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -376,6 +376,7 @@ source "package/fftw/Config.in"
>>  source "package/libargtable2/Config.in"
>>  source "package/argp-standalone/Config.in"
>>  source "package/boost/Config.in"
>> +source "package/libapr/Config.in"
>
> You should change this to "package/apr/Config.in" now that you have
> changed the location of this file. This won't even work.
>
>>  source "package/libatomic_ops/Config.in"
>>  source "package/libcap/Config.in"
>>  source "package/libcap-ng/Config.in"
>> diff --git a/package/apr/Config.in b/package/apr/Config.in
>> new file mode 100644
>> index 0000000..d156909
>> --- /dev/null
>> +++ b/package/apr/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_LIBAPR
>
> Same thing here, it should be called BR2_PACKAGE_APR.

yeah i should add the namechanges in all the places... I could have seen  
this if i tested the latest version of my patch -.-

>
>> +	bool "apr"
>> +	help
>> +	  The mission of the Apache Portable Runtime (APR) project is to  
>> create
>> +	  and maintain software libraries that provide a predictable and
>> +	  consistent interface to underlying platform-specific implementations
>
> Could you add an extra line here ?
>
>> +	  http://apr.apache.org/
>> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
>> new file mode 100644
>> index 0000000..ae91eb1
>> --- /dev/null
>> +++ b/package/apr/apr.mk
>> @@ -0,0 +1,18 @@
>> +#############################################################
>> +#
>> +# apr
>> +#
>> +#############################################################
>> +APR_VERSION = 1.4.6
>> +APR_SITE = archive.apache.org/dist/apr
>
> You should put http:// here. We use the URL's scheme to select the
> appropriate downloading method. I guess it defaults to http if no scheme
> is set, but hey, explicit is always better than implicit :)

ok i will do that, i was to lazy befor because it worked ^^

>
>> +APR_INSTALL_STAGING = YES
>> +APR_CONF_ENV = \
>> +	ac_cv_file__dev_zero=yes \
>> +	ac_cv_func_setpgrp_void=yes \
>> +	apr_cv_process_shared_works=yes \
>> +	apr_cv_mutex_robust_shared=no \
>> +	apr_cv_tcp_nodelay_with_cork=yes \
>> +	ac_cv_sizeof_struct_iovec=8 \
>> +	apr_cv_mutex_recursive=yes
>> +
>> +$(eval $(call AUTOTARGETS))
>
> Thanks,
> Maxime
>


-- 
Erstellt mit Operas revolution?rem E-Mail-Modul: http://www.opera.com/mail/
