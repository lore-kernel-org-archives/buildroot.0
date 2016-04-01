From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 1 Apr 2016 11:21:45 +0100
Subject: [Buildroot] [PATCH 1/3] libtommath: new package
In-Reply-To: <CAB0FRsuw4F7UE_h15inGxBVpFh-d4ndoM5zf+VjocjroqT+_RA@mail.gmail.com>
References: <1459498030-19700-1-git-send-email-francois.perrad@gadz.org>
 <CAGm1_kv7sWo3sMJVp9crYFcCafeNpFJoJn_Vrdp9==poDaqCJg@mail.gmail.com>
 <CAB0FRsuw4F7UE_h15inGxBVpFh-d4ndoM5zf+VjocjroqT+_RA@mail.gmail.com>
Message-ID: <56FE4BB9.8020800@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On 01/04/16 10:11, Fran?ois Perrad wrote:
> 2016-04-01 10:19 GMT+02:00 Yegor Yefremov <yegorslists@googlemail.com>:
[snip]
>>> +++ b/package/libtommath/libtommath.mk
>>> @@ -0,0 +1,21 @@
>>> +################################################################################
>>> +#
>>> +# libtommath
>>> +#
>>> +################################################################################
>>> +
>>> +LIBTOMMATH_VERSION = v1.0
>>> +LIBTOMMATH_SITE = $(call github,libtom,libtommath,$(LIBTOMMATH_VERSION))
>>
>> why don't you take official release tarballs? The same for libtomcrypt
>>
> 
> on http://www.libtom.net/, all links are on Github:
>  - https://github.com/libtom/libtomcrypt/tree/1.17
>  - https://github.com/libtom/libtomcrypt/releases/download/1.17/crypt-1.17.tar.bz2
>  - https://github.com/libtom/libtommath/tree/v1.0
>  - https://github.com/libtom/libtommath/releases/download/v1.0/ltm-1.0.tar.xz
> 
> and as far I know, the Github helper is not reliable for hash.

as far as I know, it is reliable and we have hash files for all github
packages in Buildroot. See package/a10dist for instance.

But, if you use the released tarballs (even if they are hosted in
github), you will not need to use the github helper. Just:

LIBTOMMATH_VERSION = 1.0
LIBTOMMATH_SITE =
https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz

Regards,

Vincent.
