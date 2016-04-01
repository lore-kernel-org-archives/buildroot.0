From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 1 Apr 2016 11:11:07 +0200
Subject: [Buildroot] [PATCH 1/3] libtommath: new package
In-Reply-To: <CAGm1_kv7sWo3sMJVp9crYFcCafeNpFJoJn_Vrdp9==poDaqCJg@mail.gmail.com>
References: <1459498030-19700-1-git-send-email-francois.perrad@gadz.org>
 <CAGm1_kv7sWo3sMJVp9crYFcCafeNpFJoJn_Vrdp9==poDaqCJg@mail.gmail.com>
Message-ID: <CAB0FRsuw4F7UE_h15inGxBVpFh-d4ndoM5zf+VjocjroqT+_RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-04-01 10:19 GMT+02:00 Yegor Yefremov <yegorslists@googlemail.com>:
> Hi Francois,
>
> On Fri, Apr 1, 2016 at 10:07 AM, Francois Perrad <fperrad@gmail.com> wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in                |  1 +
>>  package/libtommath/Config.in     |  7 +++++++
>>  package/libtommath/libtommath.mk | 21 +++++++++++++++++++++
>
> hash file is missing
>
>>  3 files changed, 29 insertions(+)
>>  create mode 100644 package/libtommath/Config.in
>>  create mode 100644 package/libtommath/libtommath.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 7b23519..84df812 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1233,6 +1233,7 @@ menu "Other"
>>         source "package/libsigc/Config.in"
>>         source "package/libsigsegv/Config.in"
>>         source "package/libtasn1/Config.in"
>> +       source "package/libtommath/Config.in"
>>         source "package/libtpl/Config.in"
>>         source "package/libubox/Config.in"
>>         source "package/libuci/Config.in"
>> diff --git a/package/libtommath/Config.in b/package/libtommath/Config.in
>> new file mode 100644
>> index 0000000..b2ffc72
>> --- /dev/null
>> +++ b/package/libtommath/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_LIBTOMMATH
>> +       bool "libtommath"
>> +       help
>> +         LibTomMath is a free open source portable number theoretic
>> +         multiple-precision integer library written entirely in C.
>> +
>> +         http://www.libtom.net
>> diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
>> new file mode 100644
>> index 0000000..44f21ff
>> --- /dev/null
>> +++ b/package/libtommath/libtommath.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# libtommath
>> +#
>> +################################################################################
>> +
>> +LIBTOMMATH_VERSION = v1.0
>> +LIBTOMMATH_SITE = $(call github,libtom,libtommath,$(LIBTOMMATH_VERSION))
>
> why don't you take official release tarballs? The same for libtomcrypt
>

on http://www.libtom.net/, all links are on Github:
 - https://github.com/libtom/libtomcrypt/tree/1.17
 - https://github.com/libtom/libtomcrypt/releases/download/1.17/crypt-1.17.tar.bz2
 - https://github.com/libtom/libtommath/tree/v1.0
 - https://github.com/libtom/libtommath/releases/download/v1.0/ltm-1.0.tar.xz

and as far I know, the Github helper is not reliable for hash.

Fran?ois

> Yegor
>
>> +LIBTOMMATH_LICENSE = WTFPL
>> +LIBTOMMATH_LICENSE_FILES = LICENSE
>> +LIBTOMMATH_INSTALL_STAGING = YES
>> +
>> +define LIBTOMMATH_BUILD_CMDS
>> +       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ $(TARGET_CFLAGS)"
>> +endef
>> +
>> +define LIBTOMMATH_INSTALL_STAGING_CMDS
>> +       $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
>> +endef
>> +
>> +$(eval $(generic-package))
>> --
>> 2.5.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
