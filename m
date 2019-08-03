From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 3 Aug 2019 19:08:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5base: build with correct
 optimization
In-Reply-To: <20190803122141.67580d55@windsurf.home>
References: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
 <20190626140412.101607-2-giulio.benetti@micronovasrl.com>
 <20190803122141.67580d55@windsurf.home>
Message-ID: <3450849a-4a86-3829-0297-45316e6cf76d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 03/08/2019 12:21, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed, 26 Jun 2019 16:04:12 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
>> index 26bee2cb39..4de880d2a2 100644
>> --- a/package/qt5/qt5base/qmake.conf.in
>> +++ b/package/qt5/qt5base/qmake.conf.in
>> @@ -15,6 +15,7 @@ QMAKE_CXX               = $${CROSS_COMPILE}g++
>>   # modifications to gcc-base.conf
>>   QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
>>   QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
>> +QMAKE_CFLAGS_OPTIMIZE_FULL  = $${BR_OPTIMIZATION}
>>   CONFIG                 += nostrip
>>   
>>   QMAKE_LIBS             += -lrt -lpthread -ldl
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index e4aa76908a..69e90a37b3 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -361,6 +361,7 @@ define QT5BASE_CONFIGURE_CMDS
>>   		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
>>   		-device-option BR_COMPILER_CFLAGS="$(QT5BASE_CFLAGS)" \
>>   		-device-option BR_COMPILER_CXXFLAGS="$(QT5BASE_CXXFLAGS)" \
>> +		-device-option BR_OPTIMIZATION="$(TARGET_OPTIMIZATION)" \
> 
> TARGET_OPTIMIZATION is already inside TARGET_CFLAGS, so it doesn't make
> a lot of sense to pass them again. Basically, it's just easier to set
> QMAKE_CFLAGS_OPTIMIZE, QMAKE_CFLAGS_OPTIMIZE_FULL,
> QMAKE_CFLAGS_OPTIMIZE_SIZE, QMAKE_CFLAGS_OPTIMIZE_DEBUG to the empty
> value. See the final commit at:
> 
>    https://git.buildroot.org/buildroot/commit/?id=7c0aa83527e0b0179f9e3f73a3e63df1fdc5a6e6

Good idea to override them in qmake.conf.in, I didn't think about it.

Thank you
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
