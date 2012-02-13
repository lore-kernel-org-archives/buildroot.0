From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 13 Feb 2012 09:03:23 +0100
Subject: [Buildroot] [PATCH v3-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <201202122329.36300.arnout@mind.be>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <1329073793-524-2-git-send-email-jwoltz@gmail.com>
 <201202122329.36300.arnout@mind.be>
Message-ID: <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 12, 2012 at 11:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Sunday 12 February 2012 20:09:53 J.C. Woltz wrote:
>> usb_modeswitch_data provides udev rules for usb VID/PID combinations to
>> switch usb deices from their default mode into a more useable mode. The
>> default mode usually is a cdrom with installation software that is of
>> little use in an embedded linux situation
>>
>> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
>>
>> Fix usb_modeswitch_data to depend usb_modeswitch
>> add $(TARGET_CONFIGURE_OPTS) to be consistent with usb_modeswitch
>
> ?Err... ?You just changed it into TARGET_CONFIGURE_ENV in usb_modeswitch...
>
> [snip]
>> +++ b/package/usb_modeswitch_data/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_USB_MODESWITCH_DATA
>> + ? ? depends on BR2_PACKAGE_USB_MODESWITCH
>
> ?Can we have a third opinion on whether this should be depends or select?
>

Arnout,
Do I understand correctly from this that you prefer 'select'? Could
you expand on this?

Thanks,
Thomas
