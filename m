From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Apr 2019 18:28:29 +0200
Subject: [Buildroot] [PATCH v2] package/qt5/qt5virtualkeyboard: fix
 legal-info failure
In-Reply-To: <20190411182046.13219384@windsurf.home>
References: <7895922c-6017-4eb0-66b5-e41f166e5418@micronovasrl.com>
 <20190411161652.58705-1-giulio.benetti@micronovasrl.com>
 <20190411182046.13219384@windsurf.home>
Message-ID: <4549a443-50cb-3a96-a390-4b68b6328f76@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 11/04/2019 18:20, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Thu, 11 Apr 2019 18:16:52 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>   ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
>>   QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)
>> -QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
>> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/openwnn/3rdparty/openwnn/NOTICE
>>   endif
> 
> This is fixing the issue for the 5.12 version of qt5virtualkeyboard,
> but breaking the situation for the 2.0 version of qt5virtualkeyboard
> (which is used with Qt 5.6).

You're right.

>>   
>>   ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
>>   QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
>>   QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)
>> -QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
>> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
>>   endif
> 
> Ditto.
> 
>>   ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
>>   QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
>>   QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (tcime), BSD-3-Clause (tcime)
>> -QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
>> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
>>   endif
>>   endif
> 
> Ditto.
> 
>>   
>> @@ -49,7 +49,7 @@ QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
>>   ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>>   QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
>>   else
>> -QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
>> +QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
>>   endif
> 
> This one is OK thanks to the condition.
Yes, need to modify and re-send.
Sorry for the noise.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
