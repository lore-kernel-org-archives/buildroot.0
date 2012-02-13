From: J.C. Woltz <jwoltz@gmail.com>
Date: Mon, 13 Feb 2012 11:59:46 -0500
Subject: [Buildroot] [PATCH v3-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <1329073793-524-2-git-send-email-jwoltz@gmail.com>
 <201202122329.36300.arnout@mind.be>
 <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
Message-ID: <CAC78GpeY=K+DFxVn_USw=G3c+jAB_Fa0+MtVGTvsBhQiGt3Mwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 13, 2012 at 3:03 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Sun, Feb 12, 2012 at 11:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On Sunday 12 February 2012 20:09:53 J.C. Woltz wrote:
>>> usb_modeswitch_data provides udev rules for usb VID/PID combinations to
>>> switch usb deices from their default mode into a more useable mode. The
>>> default mode usually is a cdrom with installation software that is of
>>> little use in an embedded linux situation
>>>
>>> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
>>>
[snip]
>>> +++ b/package/usb_modeswitch_data/Config.in
>>> @@ -0,0 +1,8 @@
>>> +config BR2_PACKAGE_USB_MODESWITCH_DATA
>>> + ? ? depends on BR2_PACKAGE_USB_MODESWITCH
>>
>> ?Can we have a third opinion on whether this should be depends or select?
>>
>
> Arnout,
> Do I understand correctly from this that you prefer 'select'? Could
> you expand on this?

I am waiting for an answer on that before resubmitting with the other
fix. In the mean time I noticed something else. The script that get
called from udev when it detects a device,
usr/sbin/usb_modeswitch_dispatcher, uses tclsh. Specifically
#!/usr/bin/tclsh

Three questions:
1. Should usb_modeswitch_data depend on tcl? (BR2_PACKAGE_TCL)
2. The tcl package creates a usr/bin/tclsh8.4 but not a usr/bin/tclsh.
Should the BR2_PACKAGE_TCL when BR2_PACKAGE_TCL_SHLIB_ONLY is not
selected, create a symlink?
3. How do I tell usb_modeswitch_data to depend on BR2_PACKAGE_TCL but
to exclude BR2_PACKAGE_TCL_SHLIB_ONLY?

Thank you,
J.C. Woltz
