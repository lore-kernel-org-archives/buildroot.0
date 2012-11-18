From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 18 Nov 2012 16:01:53 +0200
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <50A8D08E.7060806@petroprogram.com>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
 <CANxTyt6cjey_R_w+ZupOqUF_oaN09eF5jUDt=TWu6fUSNT8SWA@mail.gmail.com>
 <50A8CBA4.903@petroprogram.com> <50A8D08E.7060806@petroprogram.com>
Message-ID: <50A8EA51.1070505@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.11.2012 14:11, Stefan Fr?berg kirjoitti:
> 18.11.2012 13:51, Stefan Fr?berg kirjoitti:
>> Hi Danomi
>> 18.11.2012 4:14, Danomi Manchego kirjoitti:
>>>
>>>
>>>
>>> On Sat, Nov 17, 2012 at 7:15 PM, Stefan Fr?berg
>>> <stefan.froberg@petroprogram.com
>>> <mailto:stefan.froberg@petroprogram.com>> wrote:
>>>
>>>     +ifeq ($(shell sed -n "s/CONFIG_LOGIN=\(y\)/\1/p"
>>>     $(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
>>>     +BUSYBOX_DEPENDENCIES += linux-pam
>>>     +endif
>>>
>>>  
>>> Why bother with the sed?  Could you not do "ifeq
>>> ($(BR2_PACKAGE_LINUX_PAM),y)"?
>>>
>> No because I don't have a need for full linux-pam login binary.
>>
>> I only need linux-pam because I have login applet enabled inside my
>> custom BusyBox .config file
>> and that needs Linux Pam headers.
>>
> Or to but it in another way:
>
> BR2_PACKAGE_LINUX_PAM is not enough. BusyBox .config must also have
> CONFIG_LOGIN enabled.
> And that needs to be determined before the whole .mk is parsed, at a
> runtime, so that proper
> dependency can be added.
>
> In normal default buildroot provided BusyBox .config there is no
> CONFIG_LOGIN enabled in.
> So for that case this will change nothing.
>
> It seems that the stuff inside .mk files are really static (and so
> called functions are not functions at all
> but just variables containing text).
>
> So I had to go outside of .mk file for a moment and determine if
> CONFIG_LOGIN was enabled outside of extracted
> busybox  dir and then add the needed dependency.
>
> I know this is ugly but Im open to suggestions.
>
> Regards
> Stefan
>
Actually, maybe that should be changed to host-linux-pam ...
Because AFAIK, BusyBox login applet needs only headers and nothing more ???

>
>
>
>>
>> Regards
>> Stefan
>>
>>> Just a thought ...
>>> Danomi -
>>>
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121118/1381142e/attachment.html>
