From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 10 Aug 2019 22:19:12 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: drop odroidc2 from Dagg
 Stompler
In-Reply-To: <trinity-5cf0dd04-796d-45e1-a63b-54d9786be18f-1565461894224@3c-app-mailcom-bs10>
References: <20190804220044.33D7082C8B@busybox.osuosl.org>
 <a931ec3a-ed19-9641-c806-c5b79348700e@smile.fr>
 <p5k02gxd8v.ln2@ID-313208.user.individual.net>
 <trinity-06ccea36-f4d9-482d-94d2-0103406d0332-1565416208675@3c-app-mailcom-bs14>
 <26l22gxikr.ln2@ID-313208.user.individual.net>
 <trinity-5cf0dd04-796d-45e1-a63b-54d9786be18f-1565461894224@3c-app-mailcom-bs10>
Message-ID: <d81263e6-4f83-bddf-9a96-369ca2dc7f1d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daggs,

Le 10/08/2019 ? 20:31, daggs a ?crit?:
> Greetings,
> 
>> Sent: Saturday, August 10, 2019 at 2:08 PM
>> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
>> To: buildroot at uclibc.org
>> Subject: Re: [Buildroot] [git commit] DEVELOPERS: drop odroidc2 from Dagg Stompler
>>
>> Am Sat, 10 Aug 2019 07:50:08 +0200 schrieb daggs:
>>
>>> Greetings,
>>>
>>>> Am Fri, 09 Aug 2019 14:37:48 +0200 schrieb Romain Naour:
>>>>
>>>>> So up to BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_AML is related to the
>>>>> odroidc2 board (from the Buildroot packaging point of view) and
>>>>> should be removed too.
>>>>>
>>>>> Maybe KODI AML support can be used on other AML based board?
>>>
>>> as the board was dropped from the support list, I see no reason to keep
>>> this. in addition, I think that this board is fully supported without
>>> the need for external libs.
>>
>> Hi,
>>
>> sent http://patchwork.ozlabs.org/project/buildroot/list/?series=124369
>>
>> Kodi v19 will remove specific aml support as well:
>> https://github.com/xbmc/xbmc/pull/16043#issuecomment-489331416
>> and encourages users to switch to gbm support:
>> https://github.com/xbmc/xbmc/pull/16043#issuecomment-498054447
>>
>> Libreelec switched amlogic support to mainline kernel as well:
>> https://github.com/LibreELEC/LibreELEC.tv/pull/3536
>> https://github.com/xbmc/xbmc/pull/16043#issuecomment-498180789
>>
>> In the end there is no reason for us to keep the old amlogic stuff alive.
>>
>> Regards, bernd
> 
> so if I build buildroot with latest kernel and kodi, it should work ok? e.g. hw decoding and stuff?

GPU Mali 450 support has been upstreamed recently in the kernel 5.2.x and mesa3d
19.1. You need to enable the support for the Lima DRM in the kernel and Gallium
Lima driver in mesa3d.

You probably need to apply this series and a patch to add the Gallium Lima
driver in mesa3d.
http://patchwork.ozlabs.org/project/buildroot/list/?series=123227

But I can't say for kodi...

Best regards,
Romain


> 
> Dagg.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
