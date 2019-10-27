From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 27 Oct 2019 10:11:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: Bump to v1.5.1
In-Reply-To: <CANQCQpbrk0SaOak9gjtbNL4Mo_7VDMrKn9Voo=E2U9RKBw6pjw@mail.gmail.com>
References: <20191025200034.199561-1-titouan.christophe@railnova.eu>
 <CANQCQpbrk0SaOak9gjtbNL4Mo_7VDMrKn9Voo=E2U9RKBw6pjw@mail.gmail.com>
Message-ID: <a91df4c0-6cf3-e09b-f95a-5755e23e49d7@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On 10/26/19 8:41 PM, Matthew Weber wrote:
> Titouan,
> 
> On Fri, Oct 25, 2019 at 3:08 PM Titouan Christophe
> <titouan.christophe@railnova.eu> wrote:
>>
>> diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
>> index 4d0aaea601..3adfcc45a9 100644
>> --- a/package/dtc/dtc.hash
>> +++ b/package/dtc/dtc.hash
>> @@ -1,5 +1,5 @@
>>   # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
>> -sha256 c672e443c9f7e39f5a7c8e602da6777f9ad55ad70de87de300a43828c8050172  dtc-1.5.0.tar.xz
>> +sha256 660b74039690fc37013660544d09191834efb58503c73c555c5513ba75ab031f  dtc-1.5.1.tar.xz
>>
>>   # Hash for license files
>>   sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d  README.license
> 
>>>> dtc 1.5.1 Collecting legal info
> ERROR: README.license has wrong sha256 hash:
> ERROR: expected:
> 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d
> ERROR: got     :
> 78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68

Indeed, I have to shamely admit I almost never check that. Thank you for 
pointing that out. In the meantime, Fabrice did provide a fix, but I 
also added a pre-commit hook to avoid this problem in the future.

> 
>> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
>> index 0ed914ba41..ce094cfb86 100644
>> --- a/package/dtc/dtc.mk
>> +++ b/package/dtc/dtc.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -DTC_VERSION = 1.5.0
>> +DTC_VERSION = 1.5.1
>>   DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
>>   DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
>>   DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
>> --
>> 2.21.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Best,

Titouan
