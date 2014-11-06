From: Pedro Aguilar <paguilar@paguilar.org>
Date: Thu, 06 Nov 2014 22:47:37 +0100
Subject: [Buildroot] [PATCH v3 2/4] bdwgc: new package
In-Reply-To: <5459EB89.3030204@trzebnica.net>
References: <1415143709-10963-1-git-send-email-paguilar@paguilar.org>
 <1415143709-10963-3-git-send-email-paguilar@paguilar.org>
 <5459EB89.3030204@trzebnica.net>
Message-ID: <545BEC79.9090201@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

I just fixed it. I'm sending the patch.

Thanks.

On 05/11/2014 10:19, Jerzy Grzegorek wrote:
> Hi Pedro,
>
>> bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
>> conservative garbage collector can be used as a garbage collecting
>> replacement for C 'malloc' or C++ 'new'.
>>
>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>>
>> ---
>> Changes v2 -> v3:
>> - bdwgc belongs to Libraries/Other
>> - Fix license file name
>> - Comment options properly
>> - Fix a formatting issue
>> (All changes suggested by Arnout Vandecappelle)
>>
>> Changes v1 -> v2:
>> - Add external default dependency on libatomic_ops
>> - Fix several formatting issues
>> (All changes suggested by Yann Morin)
>>
>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>> ---
>>   package/Config.in       |  1 +
>>   package/bdwgc/Config.in | 11 +++++++++++
>>   package/bdwgc/bdwgc.mk  | 21 +++++++++++++++++++++
>>   3 files changed, 33 insertions(+)
>>   create mode 100644 package/bdwgc/Config.in
>>   create mode 100644 package/bdwgc/bdwgc.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 28cf703..1354c27 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -848,6 +848,7 @@ menu "Other"
>>       source "package/apr-util/Config.in"
>>       source "package/argp-standalone/Config.in"
>>       source "package/armadillo/Config.in"
>> +    source "package/bdwgc/Config.in"
>>       source "package/boost/Config.in"
>>       source "package/clapack/Config.in"
>>       source "package/classpath/Config.in"
>> diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
>> new file mode 100644
>> index 0000000..6f3878e
>> --- /dev/null
>> +++ b/package/bdwgc/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_BDWGC
>> +    bool "bdwgc"
>> +    depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
>> +    select BR2_PACKAGE_LIBATOMIC_OPS
>> +    help
>> +      The Boehm-Demers-Weiser conservative garbage collector can
>> +      be used as a garbage collecting replacement for C 'malloc'
>> +      or C++ 'new'.
>> +
>> +      http://www.hboehm.info/gc/
>> +
>> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
>> new file mode 100644
>> index 0000000..a8fde66
>> --- /dev/null
>> +++ b/package/bdwgc/bdwgc.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>>
>> +#
>> +# bdwgc
>> +#
>> +################################################################################
>>
>> +
>> +BDWGC_VERSION = 7.2f
>> +BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
>> +BDWGC_SITE = http://www.hboehm.info/gc/gc_source
>> +BDWGC_INSTALL_STAGING = YES
>> +BDWGC_LICENSE = bdwgc license
>> +BDWGC_LICENSE_FILES = README.QUICK
>> +
>> +# Patching libtool breaks build
>> +BDWGC_LIBTOOL_PATCH = NO
>> +
>> +BDWGC_DEPENDENCIES = host-bdwgc libatomic_ops
>> +
>> +$(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
>> +
>
> This trailing empty line is not needed. Same in patch 4/4.
>
> Regards,
> Jerzy
>
>


-- 
Pedro Aguilar
http://paguilar.org
