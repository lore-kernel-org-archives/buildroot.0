From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 23:46:43 +0200
Subject: [Buildroot] [PATCH] package/dropbear: add missing BSD-3-Clause
 license
In-Reply-To: <CAGm1_kttn7Ae5YM22rzmt_04P45JCg+usSTEMrTE0A6R6ar-wA@mail.gmail.com>
References: <20190528124102.21981-1-yegorslists@googlemail.com>
 <CAGm1_kttn7Ae5YM22rzmt_04P45JCg+usSTEMrTE0A6R6ar-wA@mail.gmail.com>
Message-ID: <aaf276e4-449e-c129-e4bb-3dc8d4bdcfde@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 14:44, Yegor Yefremov wrote:
> On Tue, May 28, 2019 at 2:41 PM <yegorslists@googlemail.com> wrote:
>>
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> According to the LICENSE file curve25519-donna is licensed under
>> BSD-3-Clause license.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/dropbear/dropbear.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
>> index e10c851606..c1a27f85c5 100644
>> --- a/package/dropbear/dropbear.mk
>> +++ b/package/dropbear/dropbear.mk
>> @@ -7,7 +7,7 @@
>>  DROPBEAR_VERSION = 2019.78
>>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>> -DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
>> +DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause, BSD-3-Clause
>>  DROPBEAR_LICENSE_FILES = LICENSE
>>  DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
>>  DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
>> --
>> 2.17.0
>>
> 
> Btw what part of the LICENSE file shows at BSD-2-Clause-like license?

 Hm, good question, best answered by the guy who introduced this seven years ago...

 I have no idea.

 I took the version from back then and did a licensecheck on it, and I don't see
anything that could be BSD-2-Clause-like. Maybe it was the bits with "As far as
I am concerned.." that confused me.

 I really don't know what I was smoking back then, because were already a bunch
of files with BSD-3c...

 So, feel free to remove the BSD-2-Clause-like.

 Regards,
 Arnout

> 
> I see only this:
> 
> loginrec.c
> loginrec.h
> atomicio.h
> atomicio.c
> and strlcat() (included in util.c) are from OpenSSH 3.6.1p2, and are licensed
> under the 2 point BSD license.
> 
> loginrec is written primarily by Andre Lucas, atomicio.c by Theo de Raadt.
> 
> strlcat() is (c) Todd C. Miller
> 
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
