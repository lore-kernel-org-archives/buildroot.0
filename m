From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 6 Apr 2018 21:51:38 +0200
Subject: [Buildroot] [PATCH v3 2/2] qt5base: add sunxi-mali-mainline
 eglfs backend
In-Reply-To: <2dac2310-9265-1574-ace2-2b11724b9e3b@mind.be>
References: <1510598515-29485-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1510598515-29485-2-git-send-email-giulio.benetti@micronovasrl.com>
 <2dac2310-9265-1574-ace2-2b11724b9e3b@mind.be>
Message-ID: <a8658868-9338-1fd9-dc77-0d5037256d44@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 04/04/2018 23:47, Arnout Vandecappelle ha scritto:
> 
> 
> On 13-11-17 19:41, Giulio Benetti wrote:
>> qt5base: add support for sunxi-mali-mainline eglfs backend
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/qt5/qt5base/qt5base.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index ef99131..6ea42ec 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -245,6 +245,8 @@ ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
>>   QT5BASE_EGLFS_DEVICE = eglfs_viv
>>   else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
>>   QT5BASE_EGLFS_DEVICE = eglfs_mali
>> +else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
> 
>   I've merged the two sunxi-mali cases into a single condition and applied to
> master, thanks.

Good idea, thank you.

Regards,
Giulio

> 
>   Regards,
>   Arnout
> 
>> +QT5BASE_EGLFS_DEVICE = eglfs_mali
>>   endif
>>   endif
>>   
>>
> 


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
