From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 24 Feb 2012 15:06:09 +0100
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <63D6870D443E63419AC4A0C97B86C092030FCA23@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C092030FCA15@MBXCLUSTER.mdh.local>
 <20120223123856.GG26667@sapphire.tkos.co.il>
 <63D6870D443E63419AC4A0C97B86C092030FCA18@MBXCLUSTER.mdh.local>
 <20120223171716.GA5622@tarshish>
 <63D6870D443E63419AC4A0C97B86C092030FCA22@MBXCLUSTER.mdh.local>
 <CAGm1_kut30F-BRwP8pwxbonFGJkJATSKBcJpisE0C1=QY9Ld9Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA23@MBXCLUSTER.mdh.local>
Message-ID: <CAGm1_ksrQ9Hp6LL4YiETokRf5gvJDpx3hmLqEUdSMg8eFE_xVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is zImage with u-boot specific wrapper. uImage will be created
from zImage using mkimage tool.

Yegor

On Fri, Feb 24, 2012 at 2:53 PM, Mikael ?sberg <mikael.asberg@mdh.se> wrote:
> Hi,
>
> Ok, but is uImage a compressed file like zImage? If yes, can I de-compress it somehow?
>
> Regards
>
> --------------------------------------------------------------
> Mikael ?sberg
> PhD student (Doktorand), Computer Engineering
> School of Innovation, Design and Engineering
> M?lardalen University, V?ster?s Sweden
> Phone: +46(0)21 101502
> Room nr: U1-145
> Mail: mikael.asberg at mdh.se
> --------------------------------------------------------------
> ________________________________________
> Fr?n: Yegor Yefremov [yegorslists at googlemail.com]
> Skickat: den 24 februari 2012 14:33
> Till: Mikael ?sberg
> Kopia: Baruch Siach; buildroot at busybox.net
> ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
>
> AFAIK it is always uImage format for both u-boot and barebox. RedBoot
> has used zImage.
>
> Yegor
>
> On Fri, Feb 24, 2012 at 2:19 PM, Mikael ?sberg <mikael.asberg@mdh.se> wrote:
>> Hey,
>>
>> Ok great, thx!
>>
>> One last thing, depending on which bootloader that is used, i.e., u-boot, barebox etc., does it matter which kernel image that is used for the boot (zImage, uImage, vmlinux)?
>> If I use barebox, which image can I use? (I prefer an uncompressed kernel)
>>
>> Kind regards
>>
>> --------------------------------------------------------------
>> Mikael ?sberg
>> PhD student (Doktorand), Computer Engineering
>> School of Innovation, Design and Engineering
>> M?lardalen University, V?ster?s Sweden
>> Phone: +46(0)21 101502
>> Room nr: U1-145
>> Mail: mikael.asberg at mdh.se
>> --------------------------------------------------------------
>> ________________________________________
>> Fr?n: Baruch Siach [baruch at tkos.co.il]
>> Skickat: den 23 februari 2012 18:17
>> Till: Mikael ?sberg
>> Kopia: buildroot at busybox.net
>> ?mne: Re: SV: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
>>
>> Hi Mikael,
>>
>> Please keep the list in Cc.
>>
>> On Thu, Feb 23, 2012 at 02:35:37PM +0100, Mikael ?sberg wrote:
>>> Hi,
>>>
>>> Thanks a lot for the info!
>>>
>>> I guess its easier to use Barebox, then you just also specify mxs_defconfig
>>> when you configure.
>>
>> You original question was about the Linux kernel not Barebox.
>>
>> Barebox includes support for the TX28 board which is based on i.MX28
>> (tx28stk5_defconfig).
>>
>>> One more thing, since i.MX28 uses the "454MHz ARM926EJ-S" processor, should
>>> I choose "arm926t" in the config?
>>
>> The kernel (and Barebox) defconfig files should include all the relevant
>> settings, including this one.
>>
>> baruch
>>
>>> Fr?n: Baruch Siach [baruch at tkos.co.il]
>>> Skickat: den 23 februari 2012 13:38
>>> Till: Mikael ?sberg
>>> Kopia: buildroot at busybox.net
>>> ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
>>>
>>> Hi Mikael,
>>>
>>> On Thu, Feb 23, 2012 at 12:22:09PM +0100, Mikael ?sberg wrote:
>>> > Does anyone have experience with compiling Linux kernels with Buildroot for
>>> > i.MX28 EVK?
>>> > I'm not sure which board name to be set for u-boot for example...
>>> > Also, which defconfig should be used, imx27ads_defconfig or versatile_defconfig perhaps?
>>> >
>>> > Any help or pointers would be valueable!
>>>
>>> Although it's named i.MX28, this chip is very different from i.MX27, but is
>>> similar to i.MX23. Latest kernels (since v3.0) contain mxs_defconfig, which
>>> should be suitable for i.MX28 (and i.MX23).
>>>
>>> baruch
>>
>> --
>> ? ? http://baruch.siach.name/blog/ ? ? ? ? ? ? ? ? ?~. .~ ? Tk Open Systems
>> =}------------------------------------------------ooO--U--Ooo------------{=
>> ? - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
