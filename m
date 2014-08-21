From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Thu, 21 Aug 2014 15:38:36 +0300 (IDT)
Subject: [Buildroot] [PATCH] More descriptive help text for
 usb_modeswitch
In-Reply-To: <20140821101436.GC3891@free.fr>
References: <1408557893-25786-1-git-send-email-yba@tkos.co.il>
 <20140821101436.GC3891@free.fr>
Message-ID: <alpine.DEB.2.02.1408211537030.6774@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I agree with your comment.

I will add the explanation about why the drivers are not required on Linux 
and re-submit.

Thanks,

  - yba


On Thu, 21 Aug 2014, Yann E. MORIN wrote:

> Date: Thu, 21 Aug 2014 12:14:36 +0200
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] More descriptive help text for usb_modeswitch
> 
> Jonathan, All,
>
> On 2014-08-20 21:04 +0300, Jonathan Ben-Avraham spake thusly:
>> Improve the help text for usb_modeswitch package for the benefit of the clueless.
>>
>> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
>> ---
>>  package/usb_modeswitch/Config.in |   13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
>> index 5d8a6d2..2f4c2e8 100644
>> --- a/package/usb_modeswitch/Config.in
>> +++ b/package/usb_modeswitch/Config.in
>> @@ -3,8 +3,17 @@ config BR2_PACKAGE_USB_MODESWITCH
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>>  	select BR2_PACKAGE_LIBUSB
>>  	help
>> -	  USB mode switcher.
>> -	  Used to switch mode on multiple-function devices
>> +	  Some USB devices such as modems and Wifi adapters power-up in mass
>> +	  storage mode to provide access to drivers for the device's
>
> I would be even more explixit why those drivers are not needed on a
> Linux system:
>
>    [...] to provide access to (Windows-only) drivers for the device's
>    application mode. [...]
>
> Otherwise, looks good to me:
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> +	  application mode. USB_ModeSwitch changes the mode of such devices
>> +	  from the initial mode to the application mode. Specific configuration
>> +	  data for each device model is required.
>> +
>> +	  usb_modeswitch can be used with package usb_modeswitch_data and udev
>> +	  for automatic mode switching when devices are connected.
>> +
>> +	  For more information Internet search for "Virtual CD-ROM switching
>> +	  utility".
>>
>>  	  http://www.draisberghof.de/usb_modeswitch/
>>
>> --
>> 1.7.10.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
