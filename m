Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46FDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1B461116;
	Mon, 30 May 2022 19:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qchm4dEDRvBx; Mon, 30 May 2022 19:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35A5660FCF;
	Mon, 30 May 2022 19:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E71F1BF38A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE5E417D0
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iow2uHkgWaDS for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:04:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BA89417C1
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:04:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d26so10231065wrb.13
 for <buildroot@buildroot.org>; Mon, 30 May 2022 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=7j63P9HjgQV/zbDTL6il9f2yB0LAaKjZdib3x+pBxP4=;
 b=OtFB17ElMfeypK+4wGKJtONSzm0lb3WVdVw86ZsgFKQGITjD+QprEvANG2rLtocjg3
 i0d7oi9MmfNO5IP8L5Y4+Lsjz3Yji8THJN2kEoXcEI6Wz6nirQSsh5MIlUFqM0epc8Aq
 jXq2g5D5gcQv3E06xIWYKAzXlmyY3WIcmcGxkG5VCE8uo5PEmI7e/vh3IA0w4XUL+lus
 AyHmJsMisWbhoLKXThRB78H206WZvPNlm/XypD6J9UnjPEa6nsn/pTCqq9+UzwgBILNm
 CUOrpa83ewsJPC3y5D184qIeTPDpKIeD+x9or8dbWgeSJMoLZfqq62EimxtcDrAbr2aT
 CnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=7j63P9HjgQV/zbDTL6il9f2yB0LAaKjZdib3x+pBxP4=;
 b=EJOIX3xVl0L8/LDjyZIOQMY7n0Th3S8ZwW55tPYPIwNTHJul95Nl0n9bqmx0uAMkbN
 l+CTvl8ARQpUNuT3oO7cT9c46e3ODVS9mAVd84gh52+JpCQrdeEgOEdk9CJpNxlet1cG
 B5Y8c826nSaEHPrIb7xlnV2ZVpVj0qQKtTRIx0QFNtnEaiOmHMFO5tAVoZ84ihzlNpee
 EzgBud4tlgeIhyJIkZ+gqJITcYfuYW/FfzV5uT5AnWYWfCc3n4I0oCJK4VVRhT+MEV+D
 pJdvKkD/uDh0wYe1sqG081a6mOvpIBSy5XL7emcFneTJ6jr/6kCZcOBIAexTyUdp1saE
 mScg==
X-Gm-Message-State: AOAM530VhfjjykjT3KmsTz6rl4YXtNbpRfmdIfCuqvmQHTAQkDbB6OZx
 GSi9GnQLDxCOiSo2MdB8q5gWYOhRt/Y=
X-Google-Smtp-Source: ABdhPJyLyVIhTBRpsouLfOXEAmbUXCLHWsCNlHE+CTw6GHfBrFawuiC9TYJTHTvtmo3/ZHAGOz1YDQ==
X-Received: by 2002:a05:6000:1789:b0:20c:7170:4a1c with SMTP id
 e9-20020a056000178900b0020c71704a1cmr47661922wrg.529.1653937452469; 
 Mon, 30 May 2022 12:04:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 r16-20020adff110000000b002102f986b0esm4634612wro.98.2022.05.30.12.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 12:04:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------0OAgelET32kShLOH9WVZgcoR"
Message-ID: <f76f9cc6-4188-e92a-a753-b962849f2230@gmail.com>
Date: Mon, 30 May 2022 21:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220527112146.387164-1-romain.naour@gmail.com>
 <20220528100508.GE301044@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220528100508.GE301044@scaer>
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix gcc 11 Werror
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------0OAgelET32kShLOH9WVZgcoR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Yann,

Le 28/05/2022 à 12:05, Yann E. MORIN a écrit :
> Romain, All,
> 
> On 2022-05-27 13:21 +0200, Romain Naour spake thusly:
>> Backport a patch [1] included in edk2-stable202202 release.
>>
>> Fixes:
>> https://gitlab.com/kubu93/buildroot/-/jobs/2510255569
>>
>> [1] https://github.com/tianocore/edk2/commit/ae8272ef787d80950803c521a13a308651bdc62e
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Dick Olsson <hi@senzilla.io>
> 
> Applied to master, thanks.

It seems the patch file has been corrupted by patchwork:

https://gitlab.com/buildroot.org/buildroot/-/jobs/2520605886
https://gitlab.com/buildroot.org/buildroot/-/jobs/2520605881
https://gitlab.com/buildroot.org/buildroot/-/jobs/2520605757

The sha256 should be
c07a0514942c886bbbe42645b8d10f65c4891f1d48a584c01cd92526fcfa04ca

not
296f7ef2e8da828487763a779d5154f1ab90add71aaf1150c9f262596cda0585

It's due to line ending.

See attachment file.

Best regards,
Romain


> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  ...ePkg-UsbBusDxe-fix-NOOPT-build-error.patch | 48 +++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
>>
>> diff --git a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
>> new file mode 100644
>> index 0000000000..f4f1b1565a
>> --- /dev/null
>> +++ b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
>> @@ -0,0 +1,48 @@
>> +From 59aa67f7a4d8efc564b46fe467aaf6eccec17183 Mon Sep 17 00:00:00 2001
>> +From: Gerd Hoffmann <kraxel@redhat.com>
>> +Date: Mon, 20 Dec 2021 22:32:38 +0800
>> +Subject: [PATCH] MdeModulePkg/UsbBusDxe: fix NOOPT build error
>> +
>> +gcc-11 (fedora 35):
>> +
>> +/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c: In function ?UsbIoBulkTransfer?:
>> +/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c:277:12: error: ?UsbHcBulkTransfer? accessing 80 bytes in a region of size 8 [-Werror=stringop-overflow=]
>> +
>> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> +Reviewed-by: Hao A Wu <hao.a.wu@intel.com>
>> +(cherry picked from commit ae8272ef787d80950803c521a13a308651bdc62e)
>> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> +---
>> + MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c | 2 +-
>> + MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
>> +index 7529e03e85..b2ce97ca37 100644
>> +--- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
>> ++++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
>> +@@ -285,7 +285,7 @@ UsbHcBulkTransfer (
>> +   IN  UINT8                               DevSpeed,
>> +   IN  UINTN                               MaxPacket,
>> +   IN  UINT8                               BufferNum,
>> +-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
>> ++  IN  OUT VOID                            *Data[],
>> +   IN  OUT UINTN                           *DataLength,
>> +   IN  OUT UINT8                           *DataToggle,
>> +   IN  UINTN                               TimeOut,
>> +diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
>> +index 1d2b8a6174..1316a5981f 100644
>> +--- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
>> ++++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
>> +@@ -149,7 +149,7 @@ UsbHcBulkTransfer (
>> +   IN  UINT8                               DevSpeed,
>> +   IN  UINTN                               MaxPacket,
>> +   IN  UINT8                               BufferNum,
>> +-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
>> ++  IN  OUT VOID                            *Data[],
>> +   IN  OUT UINTN                           *DataLength,
>> +   IN  OUT UINT8                           *DataToggle,
>> +   IN  UINTN                               TimeOut,
>> +-- 
>> +2.35.3
>> +
>> -- 
>> 2.35.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

--------------0OAgelET32kShLOH9WVZgcoR
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-boot-edk2-fix-patch-line-ending.patch"
Content-Disposition: attachment;
 filename="0001-boot-edk2-fix-patch-line-ending.patch"
Content-Transfer-Encoding: base64

RnJvbSBlYzlhZWJjYTYxYmVlNGZkZDA1OGY5OTg1YmJiNjAyZDJiMTZkNDkwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFp
bC5jb20+CkRhdGU6IE1vbiwgMzAgTWF5IDIwMjIgMjA6NTk6MjcgKzAyMDAKU3ViamVjdDog
W1BBVENIXSBib290L2VkazI6IGZpeCBwYXRjaCBsaW5lIGVuZGluZwoKVGhlIHBhdGNoIDAw
MDEgZnJvbSBbMV0gaGFzIGJlZW4gY29ycnVwdGVkIG9uIHRoZQpNTCBvciBwYXRjaHdvcmsu
CgpbMV0gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjIwNTI3MTEyMTQ2LjM4NzE2NC0xLXJvbWFpbi5uYW91ckBnbWFpbC5jb20vCgpT
aWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Ci0t
LQogLi4uZVBrZy1Vc2JCdXNEeGUtZml4LU5PT1BULWJ1aWxkLWVycm9yLnBhdGNoIHwgMzIg
KysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi8wMDAxLU1kZU1vZHVs
ZVBrZy1Vc2JCdXNEeGUtZml4LU5PT1BULWJ1aWxkLWVycm9yLnBhdGNoIGIvYm9vdC9lZGsy
LzAwMDEtTWRlTW9kdWxlUGtnLVVzYkJ1c0R4ZS1maXgtTk9PUFQtYnVpbGQtZXJyb3IucGF0
Y2gKaW5kZXggMTVhYmRiMjg0MC4uZjRmMWIxNTY1YSAxMDA2NDQKLS0tIGEvYm9vdC9lZGsy
LzAwMDEtTWRlTW9kdWxlUGtnLVVzYkJ1c0R4ZS1maXgtTk9PUFQtYnVpbGQtZXJyb3IucGF0
Y2gKKysrIGIvYm9vdC9lZGsyLzAwMDEtTWRlTW9kdWxlUGtnLVVzYkJ1c0R4ZS1maXgtTk9P
UFQtYnVpbGQtZXJyb3IucGF0Y2gKQEAgLTIyLDI3ICsyMiwyNyBAQCBpbmRleCA3NTI5ZTAz
ZTg1Li5iMmNlOTdjYTM3IDEwMDY0NAogLS0tIGEvTWRlTW9kdWxlUGtnL0J1cy9Vc2IvVXNi
QnVzRHhlL1VzYlV0aWxpdHkuYwogKysrIGIvTWRlTW9kdWxlUGtnL0J1cy9Vc2IvVXNiQnVz
RHhlL1VzYlV0aWxpdHkuYwogQEAgLTI4NSw3ICsyODUsNyBAQCBVc2JIY0J1bGtUcmFuc2Zl
ciAoCi0gICBJTiAgVUlOVDggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGV2U3Bl
ZWQsCi0gICBJTiAgVUlOVE4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWF4UGFj
a2V0LAotICAgSU4gIFVJTlQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJ1ZmZl
ck51bSwKLS0gIElOICBPVVQgVk9JRCAgICAgICAgICAgICAgICAgICAgICAgICAgICAqRGF0
YVtFRklfVVNCX01BWF9CVUxLX0JVRkZFUl9OVU1dLAotKyAgSU4gIE9VVCBWT0lEICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICpEYXRhW10sCi0gICBJTiAgT1VUIFVJTlROICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKkRhdGFMZW5ndGgsCi0gICBJTiAgT1VUIFVJTlQ4ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKkRhdGFUb2dnbGUsCi0gICBJTiAgVUlOVE4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVGltZU91dCwKKyAgIElOICBVSU5UOCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZTcGVlZCwNCisgICBJTiAgVUlOVE4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTWF4UGFja2V0LA0KKyAgIElOICBVSU5UOCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCdWZmZXJOdW0sDQorLSAgSU4gIE9VVCBW
T0lEICAgICAgICAgICAgICAgICAgICAgICAgICAgICpEYXRhW0VGSV9VU0JfTUFYX0JVTEtf
QlVGRkVSX05VTV0sDQorKyAgSU4gIE9VVCBWT0lEICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICpEYXRhW10sDQorICAgSU4gIE9VVCBVSU5UTiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICpEYXRhTGVuZ3RoLA0KKyAgIElOICBPVVQgVUlOVDggICAgICAgICAgICAgICAgICAg
ICAgICAgICAqRGF0YVRvZ2dsZSwNCisgICBJTiAgVUlOVE4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVGltZU91dCwNCiBkaWZmIC0tZ2l0IGEvTWRlTW9kdWxlUGtnL0J1cy9V
c2IvVXNiQnVzRHhlL1VzYlV0aWxpdHkuaCBiL01kZU1vZHVsZVBrZy9CdXMvVXNiL1VzYkJ1
c0R4ZS9Vc2JVdGlsaXR5LmgKIGluZGV4IDFkMmI4YTYxNzQuLjEzMTZhNTk4MWYgMTAwNjQ0
CiAtLS0gYS9NZGVNb2R1bGVQa2cvQnVzL1VzYi9Vc2JCdXNEeGUvVXNiVXRpbGl0eS5oCiAr
KysgYi9NZGVNb2R1bGVQa2cvQnVzL1VzYi9Vc2JCdXNEeGUvVXNiVXRpbGl0eS5oCiBAQCAt
MTQ5LDcgKzE0OSw3IEBAIFVzYkhjQnVsa1RyYW5zZmVyICgKLSAgIElOICBVSU5UOCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZTcGVlZCwKLSAgIElOICBVSU5UTiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNYXhQYWNrZXQsCi0gICBJTiAgVUlOVDggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQnVmZmVyTnVtLAotLSAgSU4gIE9VVCBWT0lE
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICpEYXRhW0VGSV9VU0JfTUFYX0JVTEtfQlVG
RkVSX05VTV0sCi0rICBJTiAgT1VUIFZPSUQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KkRhdGFbXSwKLSAgIElOICBPVVQgVUlOVE4gICAgICAgICAgICAgICAgICAgICAgICAgICAq
RGF0YUxlbmd0aCwKLSAgIElOICBPVVQgVUlOVDggICAgICAgICAgICAgICAgICAgICAgICAg
ICAqRGF0YVRvZ2dsZSwKLSAgIElOICBVSU5UTiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBUaW1lT3V0LAorICAgSU4gIFVJTlQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIERldlNwZWVkLA0KKyAgIElOICBVSU5UTiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBNYXhQYWNrZXQsDQorICAgSU4gIFVJTlQ4ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJ1ZmZlck51bSwNCistICBJTiAgT1VUIFZPSUQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKkRhdGFbRUZJX1VTQl9NQVhfQlVMS19CVUZGRVJfTlVNXSwNCisrICBJTiAg
T1VUIFZPSUQgICAgICAgICAgICAgICAgICAgICAgICAgICAgKkRhdGFbXSwNCisgICBJTiAg
T1VUIFVJTlROICAgICAgICAgICAgICAgICAgICAgICAgICAgKkRhdGFMZW5ndGgsDQorICAg
SU4gIE9VVCBVSU5UOCAgICAgICAgICAgICAgICAgICAgICAgICAgICpEYXRhVG9nZ2xlLA0K
KyAgIElOICBVSU5UTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaW1lT3V0LA0K
IC0tIAogMi4zNS4zCiAKLS0gCjIuMzUuMwoK

--------------0OAgelET32kShLOH9WVZgcoR
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------0OAgelET32kShLOH9WVZgcoR--
